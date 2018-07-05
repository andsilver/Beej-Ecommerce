# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  %i[supplier_url quantity].each do |f|
    validates f, presence: true
  end

  monetize :store_price_cents, allow_nil: true
  monetize :unit_cost_cents, allow_nil: true
  monetize :international_shipping_cents, allow_nil: true
  monetize :lynks_fees_cents, allow_nil: true
  monetize :taxes_and_customs_cents, allow_nil: true

  def cost
    return nil unless unit_cost_cents && quantity
    unit_cost_cents * quantity
  end
end
