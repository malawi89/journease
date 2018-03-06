class RemoveStartLocationFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :start_location, :string
  end
end
