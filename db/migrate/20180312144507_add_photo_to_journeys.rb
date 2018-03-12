class AddPhotoToJourneys < ActiveRecord::Migration[5.1]
  def change
    add_column :journeys, :photo, :string
  end
end
