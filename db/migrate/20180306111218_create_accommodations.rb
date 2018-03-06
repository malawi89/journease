class CreateAccommodations < ActiveRecord::Migration[5.1]
  def change
    create_table :accommodations do |t|
      t.string :sub_category
      t.string :name
      t.string :location
      t.date :checkin
      t.date :checkout
      t.string :booking_references
      t.string :comments
      t.string :contact_details
      t.string :booking_documents
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
