class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :sub_category
      t.string :name
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.string :booking_references
      t.string :comments
      t.string :contact_details
      t.string :booking_documents
      t.string :photo
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
