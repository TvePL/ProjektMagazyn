class CreateDeliveries < ActiveRecord::Migration[8.0]
  def change
    create_table :deliveries do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.date :order_date

      t.timestamps
    end
  end
end
