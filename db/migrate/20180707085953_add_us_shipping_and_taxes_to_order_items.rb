class AddUsShippingAndTaxesToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :us_shipping_and_taxes_cents, :integer
  end
end
