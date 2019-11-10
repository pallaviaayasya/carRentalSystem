class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :customer, foreign_key: true, null: false
      t.string :card_type, null: false
      t.string :card_no, null: false
      t.date :expiry_date, null: false
      t.integer :cvv, null: false

      t.timestamps
    end
    add_index :payments, :card_no, unique: true
  end
end
