# frozen_string_literal: true

class Coupon < ApplicationRecord
  monetize :fixed_amount_cents, allow_nil: true
  validates :code, presence: true, uniqueness: true
  validates :discount_percentage, presence: true, unless: :fixed_amount
  validate :validate_either_percentage_discount_either_fixed

  def compute_discount(total)
    discount = fixed_amount if fixed_amount
    discount = total * discount_percentage / 100 if discount_percentage

    return total if discount > total
    discount
  end

  def coupon_type
    return 'Fixed Amount' if fixed_amount
    return 'Percentage discount' if discount_percentage
  end

  private

  def validate_either_percentage_discount_either_fixed
    if discount_percentage && fixed_amount
      errors.add(:discount_percentage, 'You cannot select both, fixed amount and percentage discount')
      false
    end

    true
  end
end
