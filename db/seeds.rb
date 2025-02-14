# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'
puts "Cleaning the DB...."
List.destroy_all
Movie.destroy_all

# the Le Wagon copy of the API
puts "Creating movies.... \n"
(1..5).to_a.each do |num|
  url = "http://tmdb.lewagon.com/movie/top_rated?page=#{num}"
  response = JSON.parse(URI.open(url).read)

  response['results'].each do |movie_hash|
    puts "...creating the movie #{movie_hash['title']}..."
    puts
    # create an instance with the hash
    Movie.create!(
      poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
      rating: movie_hash['vote_average'],
      title: movie_hash['title'],
      overview: movie_hash['overview']
    )
  end
end

puts "Creating lists.... \n"
List.create!(
  name: "Movies list for later"
)

List.create!(
  name: "Best movies"
)

List.create!(
  name: "Worst movies"
)
puts "Created #{List.count} lists.\n"
puts "Adding movies...\n"
movie_comments = [
  "Amazing cinematography! A must-watch.",
  "The plot was a bit slow, but the acting was top-notch.",
  "Loved the twist at the end!",
  "Not as good as the original, but still enjoyable.",
  "Great soundtrack, really set the mood.",
  "The characters felt so real and relatable.",
  "Too many plot holes, but the action scenes were fun.",
  "A masterpiece—I'll be thinking about this movie for days."
]
List.all.each do |list|
  puts "getting movies"
  movies = Movie.all.to_a
  (0..rand(5..10)).each do |num|
    puts "picking a movie for the #{list.name}"
    movie = movies.sample
    puts "Movie #{movie.title} picked..."
    Bookmark.create!(
      comment: movie_comments.sample,
      list: list,
      movie: movies.sample
    )
    puts "---Movie: #{movie.title} saved in the list: #{list.name}----"
    movies.delete(movie)
  end
end

puts "... created #{Movie.count} movies."
