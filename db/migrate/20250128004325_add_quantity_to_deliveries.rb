class AddQuantityToDeliveries < ActiveRecord::Migration[8.0]
  def change
    add_column :deliveries, :quantity, :integer
  end
end
