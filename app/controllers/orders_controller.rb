# frozen_string_literal: true

class OrdersController < AuthenticatedController
  def index
    @orders = current_user.orders
  end

  def show
#    @order = Order.where(user: current_user).find(params[:id])
  end
end
