# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Rails.env.production?
  Book.create!([
    { title: "The Great Gatsby" },
    { title: "To Kill a Mockingbird" },
    { title: "Pride and Prejudice" },
    { title: "The Catcher in the Rye" },
    { title: "Lord of the Flies" }
  ])
else
  Book.create!([
    { title: "Harry Potter and the Sorcerer's Stone" },
    { title: "The Hunger Games" },
    { title: "Percy Jackson and the Lightning Thief" },
    { title: "Diary of a Wimpy Kid" },
    { title: "The Maze Runner" }
  ])
end
