# frozen_string_literal: true

class Admin::OrdersController < Admin::ApplicationController
  def index
    @orders = Order.all
  end

  def edit
    @order = Order.find(params[:id])
  end

  def review
    @order = Order.find(params[:order_id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to [:edit, :admin, @order], notice: 'Order successfully updated'
    else
      flash.now[:error] = @order.errors.full_messages.to_sentence
      render :edit
    end
  end

  def process_review
    @order = Order.find(params[:order_id])
    if @order.update(order_params)
      redirect_to [:edit, :admin, @order], notice: 'Order successfully reviewed'
    else
      flash.now[:error] = @order.errors.full_messages.to_sentence
      render :review
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :status,
      order_items_attributes:
      %i[
        id
        unit_cost
        item_weight
        international_shipping
        lynks_fees
        taxes_and_customs
        us_shipping_and_taxes
      ]
    )
  end
end
