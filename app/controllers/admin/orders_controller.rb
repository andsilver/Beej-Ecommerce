# frozen_string_literal: true

class Admin::OrdersController < Admin::ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end
end
