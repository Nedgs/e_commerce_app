class CreateProducts < ActiveRecord::Migration[6.0]
    def change
      create_table :products do |t|
        t.string :name, null: false
        t.text :description, null: false
        t.decimal :price, null: false, precision: 10, scale: 2
        t.integer :stock, null: false
        t.references :seller, null: false, foreign_key: { to_table: :users }
  
        t.timestamps
      end
    end
end
  