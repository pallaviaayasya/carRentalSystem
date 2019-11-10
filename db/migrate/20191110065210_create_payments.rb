class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :card_type
      t.string :card_no
      t.date :expiry_date
      t.integer :cvv

      t.timestamps
    end
  end
end
