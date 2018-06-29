# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
#    raise current_user.inspect
  end
end
