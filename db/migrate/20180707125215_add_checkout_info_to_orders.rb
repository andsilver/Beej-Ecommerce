class AddCheckoutInfoToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :shipping_full_name, :string
    add_column :orders, :shipping_address_line1, :string
    add_column :orders, :shipping_address_line2, :string
    add_column :orders, :shipping_city, :string
    add_column :orders, :shipping_phone_number, :string
    add_column :orders, :coupon_code_to_apply, :string
  end
end
