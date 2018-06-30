# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

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

    order = Order.create!(user: user, order_items: order_items)
  end

  def total_price
  end

  def number
    id
  end

  def client_name
    user.name
  end

  def status
    :pending
  end
end
