class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :name 
      t.string :postal_code
      t.string :address
      t.integer :postage, default: "800"
      t.integer :amount_money
      t.integer :payment_method
      t.integer :status

      t.timestamps
    end
  end
end

