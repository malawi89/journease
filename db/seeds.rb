# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Wiping database..."
User.destroy_all
Trip.destroy_all

puts "Wiped!"

puts "Seeding database..."

test = User.create!(email: 'test@test.com', password: '123456', password_confirmation: '123456', first_name: 'Testy', last_name: 'McTest')
other = User.create!(email: 'test1@test.com', password: '123456', password_confirmation: '123456', first_name: 'Other', last_name: 'McOtherson')

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: '123456',
    password_confirmation: '123456',
    username: Faker::Name.name,
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    )
  user.save!
end

3.times do
  trip = Trip.new(
    name: Faker::Name.name,
    start_date: 6.days.from_now,
    end_date: 10.days.from_now
    )
  trip.save!
  TripUser.create!(trip: trip, user: test)
end

3.times do
  trip = Trip.new(
    name: Faker::Name.name,
    start_date: 6.days.from_now,
    end_date: 10.days.from_now
    )
  trip.save!
  TripUser.create!(trip: trip, user: other)
end

trip_ids = Trip.all.map(&:id)
# trip_ids = Trip.all.map { |trip| trip.id)

25.times do
  journey = Journey.new(
  trip_id: trip_ids.sample,
  sub_category: "train",
  departure_location: ["138 kingsland road, London", "121 Winslow Road, Wingrave", "Brighton Pier, Brighton", "Windsor Castle", "350 Queens Quay W, Toronto", "Blantyre, Malawi", "Paris, France", "Athens, Greece"].sample,
  arrival_location: ["138 kingsland road, London", "121 Winslow Road, Wingrave", "Brighton Pier, Brighton", "Windsor Castle", "350 Queens Quay W, Toronto", "Blantyre, Malawi", "Paris, France", "Athens, Greece", "Sparta, Greece", "Istanbul, Turkey"].sample
    )
  journey.save!
end

puts "Done!"
