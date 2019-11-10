class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :car_no, null: false
      t.string :car_name, null: false
      t.string :car_type, null: false
      t.string :car_city, null: false
      t.string :car_area, null: false
      t.float  :rate

      t.timestamps
    end
  end
end
