class AddCoordinatesToJourneys < ActiveRecord::Migration[5.1]
  def change
    add_column :journeys, :latitude, :float
    add_column :journeys, :longitude, :float
  end
end
