class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :code, unique: true
      t.integer :fixed_amount_cents
      t.float :discount_percentage
      t.integer :max_usages_count
      t.timestamps null: false
    end
  end
end
