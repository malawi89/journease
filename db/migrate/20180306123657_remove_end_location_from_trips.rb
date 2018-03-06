class RemoveEndLocationFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :end_location, :string
  end
end
