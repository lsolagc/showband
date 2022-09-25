# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

5.times do
  band = Faker::Music::RockBand.name
  3.times do
    Music.create!(title: Faker::Music::RockBand.song, artist: band, available: true)
    Music.create!(title: Faker::Music::RockBand.song, artist: band, available: false)
  end
end