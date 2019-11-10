class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings, id: false do |t|
      t.references :customer, foreign_key: true, null: false
      t.string :car_no, references: :cars, null: false
      t.primary_key :booking_id
      t.date :booking_date
      t.date :returned_date
      t.float :total_amount
      t.string :card_no, null: false

      t.timestamps
    end

    add_foreign_key :bookings, :cars, column: 'car_no', primary_key: 'car_no'
  end
end
