# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'open-uri'
require 'json'

puts "seeding..."

url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies_array = JSON.parse(movies_serialized)
movies = movies_array['results']

movies.sample(10).each do |movie|
  Movie.create(title: movie['title'], overview: movie['overview'], poster_url: movie['poster_path'], rating: movie['vote_average'])
end

puts "seeded."
