class ChangePrimaryKeyOfCarTableToCarNo < ActiveRecord::Migration[6.0]
  def up
    remove_column :cars, :id # remove existing primary key
    execute "ALTER TABLE cars ADD CONSTRAINT cars_pkey PRIMARY KEY (car_no);"
  end

  def down
    execute "ALTER TABLE cars DROP CONSTRAINT cars_pkey;"
    add_column :cars, :id, :primary_key
  end
end
