class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.belongs_to :order
      t.string :supplier_url
      t.integer :quantity
      t.string :title
      t.string :description
      t.text :instructions
      t.string :image_url
      t.integer :store_price_cents
      t.integer :unit_cost_cents
      t.integer :international_shipping_cents
      t.integer :lynks_fees_cents
      t.integer :taxes_and_customs_cents
      t.float :item_weight

      t.timestamps null: false
    end
  end
end
