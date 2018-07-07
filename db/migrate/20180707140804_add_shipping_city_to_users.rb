class AddShippingCityToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :shipping_city, :string
  end
end
