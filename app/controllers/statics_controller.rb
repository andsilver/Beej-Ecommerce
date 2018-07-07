# frozen_string_literal: true

class StaticsController < ApplicationController
  before_action { redirect_to admin_orders_path if current_user&.admin? }
  def index; end

  def how_it_works;end

  def login_signup
    @user = User.new
    @new_user = User.new
  end
end
