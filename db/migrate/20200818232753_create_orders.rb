class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :food_bank_id
      t.string :protein
      t.string :vegetable
      t.string :fruit
      t.string :grain
      t.string :dairy
      t.string :dessert

      t.timestamps
    end
  end
end
