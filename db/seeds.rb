# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Make the default admin
puts 'Creating default admin account.'
User.create(
  name: 'Mike',
  email: 'mikecm@gmail.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true
)
puts 'Created default admin account.'

# Make some default genres
puts 'Creating default genres...'
default_genres = %w[Action Adventure Comedy Reality Educational Romance Thriller Suspense Drama Crime Documentary Fantasy History Science Sci-Fi]
default_genres.sort!
default_genres.each do |genre|
  Genre.create!(title: genre)
  puts "Added #{genre} to genre table."
end
puts 'Created default genres.'
