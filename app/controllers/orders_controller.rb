# frozen_string_literal: true

class OrdersController < AuthenticatedController
  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def cancel
    @order = current_user.orders.find(params[:order_id]).update(status: :cancelled)
    redirect_to root_url, notice: 'Order cancelled'
  end
end
