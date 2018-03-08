class CreateJourneys < ActiveRecord::Migration[5.1]
  def change
    create_table :journeys do |t|
      t.string :sub_category
      t.string :name
      t.string :travel_company
      t.string :travel_number
      t.string :seats
      t.string :departure_location
      t.datetime :start_time
      t.string :arrival_location
      t.datetime :end_time
      t.string :booking_references
      t.string :comments
      t.string :contact_details
      t.string :booking_documents
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
