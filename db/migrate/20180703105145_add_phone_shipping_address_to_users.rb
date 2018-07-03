class AddPhoneShippingAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :shipping_address_line1, :string
    add_column :users, :shipping_address_line2, :string
    add_column :users, :phone, :string
  end
end
