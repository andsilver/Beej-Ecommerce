# frozen_string_literal: true

class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action { redirect_to '/', alert: 'Not authorized.' unless current_user.admin? }
  layout 'admin'
end
