# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  before_action :authenticate_user!
  #  before_action { redirect_to admin_orders_path if current_user&.admin? }
end
