# frozen_string_literal: true

class CartItemsController < AuthenticatedController
  def index
    @cart_items = cart_items.order(:created_at)
  end

  def thank_you
    @order_number = flash[:order_number]
    @order_id = flash[:order_id]
    redirect_to root_path unless @order_number && @order_id
  end

  # send to review
  def checkout
    items = cart_items.all
    redirect_to(:cart_items) && return unless items.count.positive?

    order_number = nil
    order_id = nil

    Order.transaction do
      order = Order.create_from_cart_items!(items: items, user: current_user)
      order_number = order.number
      order_id = order.id
      items.each(&:destroy)
    end
    flash[:order_number] = order_number
    flash[:order_id] = order_id
    redirect_to %i[thank_you cart_items]
  end

  def create
    @cart_item = cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to :cart_items, notice: 'Product added to cart'
    else
      flash[:error] = @cart_item.errors.full_messages.to_sentence
      # render 'statics/home'
      redirect_to :cart_items # Review this!
    end
  end

  def update
    @cart_item = cart_items.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to :cart_items, notice: 'Updated'
    else
      redirect_to :cart_items, error: @cart_item.errors.full_messages.to_sentence
    end
  end

  def destroy
    cart_items.find(params[:id]).destroy
    redirect_to :cart_items, notice: 'Product removed from cart'
  end

  private

  def cart_items
    current_user.cart_items
  end

  def cart_item_params
    params.require(:cart_item).permit(
      :quantity,
      :title,
      :description,
      :instructions,
      :image_url,
      :supplier_url
    )
  end
end
