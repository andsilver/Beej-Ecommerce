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
  monetize :us_shipping_and_taxes_cents, allow_nil: true

  def cost
    return nil unless unit_cost && quantity
    unit_cost * quantity
  end

  def complete_information?
    ready_to_review?
  end

  def ready_to_review?
    %i[unit_cost item_weight international_shipping lynks_fees taxes_and_customs
       us_shipping_and_taxes].all? do |f|
      send(f).present?
    end
  end
end
