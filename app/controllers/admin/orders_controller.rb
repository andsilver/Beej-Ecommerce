# frozen_string_literal: true

class Admin::OrdersController < Admin::ApplicationController
  def index
    @orders = Order.all
  end
end
