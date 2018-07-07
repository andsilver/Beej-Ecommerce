# frozen_string_literal: true

class OrdersController < AuthenticatedController
  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def cancel
    current_user.orders.find(params[:order_id]).update(status: :cancelled)
    redirect_to root_url, notice: 'Order cancelled'
  end

  def checkout
    @order = current_user.orders.find(params[:order_id])
    (redirect_to(:orders, notice: 'Order not ready for checkout') && return) unless @order.status == 'reviewed'
  end

  def process_checkout
    @order = current_user.orders.find(params[:order_id])
    (redirect_to(:orders, error: 'Order not ready for checkout') && return) unless @order.status == 'reviewed'

    @order.assign_attributes(checkout_params)
    if @order.valid_for_checkout?
      @order.status = 'confirmed'
      @order.save
      redirect_to order_confirmation_path(@order)
    else
      flash.now[:error] = @order.errors.full_messages.to_sentence
      render :checkout
    end
  end

  def confirmation
    @order = current_user.orders.find(params[:order_id])
    (redirect_to(:orders, error: 'Something went wrong') && return) unless @order.status == 'confirmed'
    # render
  end

  private

  def checkout_params
    params.require(:order).permit(
      :shipping_full_name,
      :shipping_address_line1,
      :shipping_address_line2,
      :shipping_city,
      :coupon_code_to_apply
    )
  end
end
