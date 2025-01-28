class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :quantity
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps


      remove_foreign_key :products, :users
      remove_foreign_key :products, :categories

      add_foreign_key :products, :users, on_delete: :cascade
      add_foreign_key :products, :categories, on_delete: :cascade
    end
  end
end
