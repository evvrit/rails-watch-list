require 'open-uri'
require 'json'

puts "cleaning the DB..."
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all
puts "DB is clean."

puts "seeding..."

url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies_array = JSON.parse(movies_serialized)
movies = movies_array['results']

movies.sample(10).each do |movie|
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end

puts "#{Movie.count} movie(s) seeded."
