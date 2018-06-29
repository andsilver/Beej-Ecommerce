# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order
  %i[supplier_url quantity].each do |f|
    validates f, presence: true
  end

  monetize :store_price_cents
  monetize :unit_cost_cents
  monetize :international_shipping_cents
  monetize :lynks_fees_cents
  monetize :taxes_and_customs_cents
end
