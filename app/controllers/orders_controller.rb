# frozen_string_literal: true

class OrdersController < AuthenticatedController
  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
