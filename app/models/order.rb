# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  enum status: %i[reviewing reviewed confirmed received_usa_hub paid
                  out_for_delivery delivered on_hold returned cancelled]
  accepts_nested_attributes_for :order_items
  validate :valid_status_change

  def has_checkout_information?
    status != 'reviewing'
  end

  def can_checkout?
    status == 'reviewed'
  end

  def self.create_from_cart_items!(items:, user:)
    order_items = items.map do |item|
      OrderItem.new(
        supplier_url: item.supplier_url,
        quantity: item.quantity,
        title: item.title,
        description: item.description,
        instructions: item.instructions,
        image_url: item.image_url,
        unit_cost: nil,
        store_price: nil,
        international_shipping: nil,
        lynks_fees: nil,
        taxes_and_customs: nil
      )
    end

    Order.create!(user: user, order_items: order_items)
  end

  def number
    id
  end

  delegate :name, :phone, :email, prefix: :client, to: :user

  def valid_for_checkout?
    errors.add(:shipping_full_name, :blank) unless shipping_full_name.present?
    errors.add(:shipping_address_line1, :blank) unless shipping_address_line1.present?
    errors.add(:shipping_city, :blank) unless shipping_city.present?
    return false if errors.any?

    true
  end

  def shipping_address
    user.shipping_address_line1
  end

  def items_count
    order_items.count
  end

  def subtotal
    return nil unless prices_ready?
    order_items.sum(&:unit_cost)
  end

  def us_shipping_and_taxes
    return nil unless prices_ready?
    order_items.sum(&:us_shipping_and_taxes)
  end

  def total_weight
    return nil unless prices_ready?
    order_items.sum(&:item_weight)
  end

  def international_shipping
    return nil unless prices_ready?
    order_items.sum(&:international_shipping)
  end

  def local_customs_and_taxes
    return nil unless prices_ready?
    order_items.sum(&:taxes_and_customs)
  end

  def fees
    return nil unless prices_ready?
    order_items.sum(&:lynks_fees)
  end

  def prices_ready?
    order_items.all?(&:complete_information?)
  end

  def total_price
    return nil unless prices_ready?
    subtotal + us_shipping_and_taxes + international_shipping +
      local_customs_and_taxes + fees
  end

  private

  def valid_status_change
    return true unless status == 'reviewed'
    return true if order_items.all?(&:ready_to_review?)
    errors.add(:status, 'Data of all items should be completed before review')
  end
end
