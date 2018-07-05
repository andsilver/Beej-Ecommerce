# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  enum status: %i[reviewing reviewed confirmed received_usa_hub paid
  out_for_delivery delivered on_hold returned cancelled]

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

  def total_price; end
  def shipping_address
    user.shipping_address_line1
  end

  def payment_method
    'By credit card'
  end

  def checkout_at
    '25 April 2018 - 8:14am'
  end

  def items_count
    order_items.count
  end

  def subtotal
    item_costs = order_items.map(&:cost)
    return nil unless item_costs.all?

    item_costs.sum
  end

  def us_shipping_and_taxes
  end

  def total_weight
  end

  def international_shipping
  end

  def local_customs_and_taxes
  end

  def fees
  end
end
