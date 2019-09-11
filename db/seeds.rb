# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
addresses = ['Ben yehuda 32, Tel Aviv',
 'Dizengoff 55, Tel Aviv',
 'Hashuk 32, Tel Aviv',
 'Dizengoff 32, Tel Aviv',
 'Hashuk 11, Tel Aviv',
 'Tel Aviv',
 'bograshov 13, Tel Aviv',
 'bograshov 32, Tel Aviv',
 'Daniel 2, Tel Aviv',
 'hatavor 2, Tel Aviv',
 'hatavor 10, Tel Aviv',
 'yavniel 2, Tel Aviv',
 'yavniel 10, Tel Aviv',
 'degania 2, Tel Aviv',
 'neve tzedek 2, Tel Aviv',
 'neve tzedek 20, Tel Aviv']

i = 0
10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 123456,
    description: Faker::Lorem.paragraph,
    name: Faker::Name.name,
    address: addresses.sample,
    remote_photo_url: 'https://picsum.photos/200'
    )
  user.save
  if user.persisted?
    pet = Pet.new(
      location: user.address,
      name: Faker::Name.name,
      remote_photo_url: "https://placedog.net/50#{i}",
      age: Faker::Number.between(from: 1, to: 10),
      pet_type: "Dog",
      breed: Faker::Creature::Dog.breed,
      color: Faker::Color.color_name,
      description: Faker::TvShows::FamilyGuy.quote,
      needs: Faker::Food.description,
      price: Faker::Number.decimal(l_digits: 2),
      location: user.address
      )
    pet.user = user
    pet.save
    i += 1
  end
end

