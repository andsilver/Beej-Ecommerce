# frozen_string_literal: true

class Admin::CouponsController < Admin::ApplicationController
  def index
    @coupons = Coupon.all
  end

  def new
    @coupon = Coupon.new
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

  def edit
    @coupon = Coupon.find(params[:id])
  end

  def create
    @coupon = Coupon.new(coupon_params)
    if @coupon.save
      redirect_to %i[admin coupons], notice: 'Coupon succesfuly created'
    else
      flash.now[:error] = @coupon.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @coupon = Coupon.find(params[:id])
    if @coupon.update(coupon_params)
      redirect_to %i[admin coupons], notice: 'Coupon succesfuly updated'
    else
      flash.now[:error] = @coupon.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @coupon = Coupon.find(params[:id])
    @coupon.destroy
    redirect_to %i[admin coupons], notice: 'Coupon succesfully deleted'
  end

  private

  def coupon_params
    params.require(:coupon).permit(
      :code,
      :fixed_amount,
      :discount_percentage
    )
  end
end
