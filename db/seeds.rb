# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "http"
require "json"

Review.destroy_all
Restaurant.destroy_all
User.destroy_all

def search(type, category, location)
  url = "https://api.yelp.com/v3/businesses/search"
  params = {
    term: type,
    categories: category,
    location: location,
    limit: 50,
    radius: 8000,

  }

  response = HTTP.auth("Bearer #{ENV["API_KEY"]}").get(url, params: params)

  response.parse["businesses"]
end

new_response = search("asian", "food", "10013")

new_response.each do |restaurant|
  # byebug
  Restaurant.create(
    name: restaurant["name"],
    image_url: restaurant["image_url"],
    rating: restaurant["rating"],
    price: restaurant["price"],
    address: restaurant["location"]["display_address"][0],
    phone: restaurant["display_phone"],
  )
end

# test user
hami = User.create(username: "Saiko124", password: "ronaldo9")
first_restaurant = Restaurant.all.first

# byebug
# testing joiner model
hami_comment_1 = Review.create(
  comment: " Rails is dynamic",
  user: hami,
  restaurant: first_restaurant,

)
