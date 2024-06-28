class CreateOrders < ActiveRecord::Migration[6.0]
    def change
      create_table :orders do |t|
        t.references :product, null: false, foreign_key: true
        t.references :buyer, null: false, foreign_key: { to_table: :users }
        t.integer :quantity, null: false
        t.decimal :total_price, null: false, precision: 10, scale: 2
  
        t.timestamps
      end
    end
end
  