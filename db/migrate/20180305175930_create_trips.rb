class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :start_location
      t.string :end_location
      t.string :photo

      t.timestamps
    end
  end
end
