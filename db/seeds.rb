require 'open-uri'
require 'json'
puts "cleaning the DB..."
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
    poster_url: "https://image.tmdb.org/t/p/#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end

puts "#{Movie.count} movie(s) seeded."
