require 'rest-client'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

API_KEY = 'd381694a730404d4338c1205f04acd69'
SHOWS = [
  'Futurama',
  'The Simpsons',
  'Better Call Saul',
  'The Crown',
  'Game of Thrones',
  'Suits',
  'Doctor Who',
  'Friends',
  'Seinfeld',
  'NCIS',
  'Stargate SG-1',
  'The Office',
  'Parks and Recreation',
  'Silicon Valley',
  '30 Rock',
  'Frasier',
  'South Park',
  'Breaking Bad',
  'The 100',
  'American Horror Story',
  'Bones',
  'Westworld',
  'How I Met Your Mother',
  'Star Trek: The Next Generation',
  'Smallville',
  'House',
  'Lost',
  'Mr. Robot',
  'Twin Peaks',
  'Dexter',
  'Top Gear',
  'Brooklyn Nine-Nine',
  'The Goldbergs',
  'The Expanse',
  'House of Cards',
  'Community',
  'New Girl',
  'The X-Files',
  'Stranger Things'
]

def show_info_api(show_title)
  search_response = RestClient.get(
    "https://api.themoviedb.org/3/search/tv?query=#{show_title}&language=en-US&api_key=d381694a730404d4338c1205f04acd69",
    headers = { api_key: API_KEY }
  )
  api_show_id = JSON.parse(search_response)["results"][0]["id"]

  details_response = RestClient.get(
    "https://api.themoviedb.org/3/tv/#{api_show_id}?api_key=d381694a730404d4338c1205f04acd69&language=en-US",
    headers = { api_key: API_KEY }
  )

  {
    title:    show_title,
    year:     JSON.parse(details_response)["first_air_date"][0..3].to_i,
    image:    "https://image.tmdb.org/t/p/original/#{JSON.parse(details_response)["poster_path"]}",
    runtime:  JSON.parse(details_response)["episode_run_time"].first,
    genres:   JSON.parse(details_response)["genres"],
    overview: JSON.parse(details_response)["overview"]
  }
end

# Make the default admin
puts 'Creating default admin account.'
User.create(
  name: 'Mike',
  email: 'mikecm@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  role: 1
)
puts 'Created default admin account.'

# Create some shows with info from API
puts "Adding some shows..."
SHOWS.each do |show_title|
  puts "Getting information for #{show_title}..."
  show_data = show_info_api(show_title)
  puts "Adding #{show_title}..."
  show = Show.create(
    title:    show_data[:title],
    year:     show_data[:year],
    image:    show_data[:image],
    runtime:  show_data[:runtime],
    overview: show_data[:overview]
  )
  puts "Adding genres to #{show_title}..."
  show_data[:genres].each do |genre|
    show.genres << Genre.find_or_create_by(title: genre["name"])
  end
  puts "Added genres to #{show_title}."

  puts "Added #{show_title}."
end
puts "Added shows."
