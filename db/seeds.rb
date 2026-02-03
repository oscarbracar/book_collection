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
    {title: "Production Book 1"},
    {title: "Production Book 2"},
    {title: "Production Book 3"},
    {title: "Production Book 4"},
    {title: "Production Book 5"}
  ])
else
  Book.create!([
    {title: "Development Book 1"},
    {title: "Development Book 2"},
    {title: "Development Book 3"},
    {title: "Development Book 4"},
    {title: "Development Book 5"}
  ])
end
