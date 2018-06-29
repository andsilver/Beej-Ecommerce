# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_items = cart_items
  end

  def create
    @cart_item = cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to :cart_items, notice: 'Product added to cart'
    else
      flash[:error] = @cart_item.errors.full_messages.to_sentence
      # render 'statics/home'
      redirect_to :cart_items # Review this!
    end
  end

  def destroy
    cart_items.find(params[:id]).destroy
    redirect_to :cart_items, notice: 'Product removed from cart'
  end

  private
  def cart_items
    current_user.cart_items
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :title, :description, :image_url, :supplier_url)
  end
end
