class CreateOders < ActiveRecord::Migration[6.1]
  def change
    create_table :oders do |t|
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :postage
      t.integer :amount_money
      t.integer :payment_method
      t.integer :status
      t.timestamps
    end
  end
end
