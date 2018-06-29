class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.belongs_to :user
      t.integer :quantity
      t.string :title
      t.string :description
      t.string :image_url
      t.text :instructions
      t.string :supplier_url

      t.timestamps null: false
    end
  end
end
