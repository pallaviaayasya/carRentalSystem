class CreateTriggerOnBookingInsert < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TRIGGER tr_total_amount
      BEFORE INSERT ON bookings
      FOR EACH ROW
      SET NEW.total_amount=(SELECT rate FROM cars where car_no=NEW.car_no) * (DATEDIFF(NEW.returned_date, NEW.booking_date)) * 24;
    SQL
  end

  def down
    execute <<-SQL
      DROP TRIGGER tr_total_amount;
    SQL
  end
end
