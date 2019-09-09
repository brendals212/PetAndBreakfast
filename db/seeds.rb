# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pet.destroy_all
User.destroy_all


rachel = User.create(email: "rgarih@gmail.com", password: "123456", name: "Cunegonde", address: "32 Ben Yehuda TLV")
brenda = User.create(email: "brendals212h@gmail.com", password: "123456", name: "Cunende", address: "32 Ben Yehuda TLV")


r_pet1 = Pet.create(name: "boulou", user_id: rachel.id, photo: "https://st3.idealista.com/cms/archivos/styles/idcms_social_mobile/public/2019-02/media/image/pets%201%20pixabay.jpg?fv=eCIcXO0r&itok=hbSGjOxv")
r_pet2 = Pet.create(name: "kitty", user_id: rachel.id, photo: "https://www.condorferries.co.uk/media/2455/taking-your-pet-5.jpg")
