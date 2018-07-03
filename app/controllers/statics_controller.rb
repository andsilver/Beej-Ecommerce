# frozen_string_literal: true

class StaticsController < ApplicationController
  def index; end

  def how_it_works;end

  def login_signup
    @user = User.new
    @new_user = User.new
  end
end
