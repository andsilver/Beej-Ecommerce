# frozen_string_literal: true

class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to %i[admin users], notice: 'User sucessfully updated'
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to %i[admin users], notice: 'User successfully created'
    else
      flash.now[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :wallet_balance,
      :name,
      :email,
      :phone,
      :shipping_address_line1,
      :shipping_address_line1,
      :shipping_city,
      :password,
      :admin
    )
  end
end
