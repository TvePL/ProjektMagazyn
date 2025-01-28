class CreateDeliveries < ActiveRecord::Migration[8.0]
  def change
    create_table :deliveries do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.date :order_date

      t.timestamps


      remove_foreign_key :deliveries, :products

      add_foreign_key :deliveries, :products, on_delete: :cascade
    end
  end
end
