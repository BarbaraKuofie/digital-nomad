# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all 
Country.destroy_all
City.destroy_all
Property.destroy_all
Review.destroy_all
Stay.destroy_all

30.times do
    User.create({
        name: Faker::Name.unique.name,
        host: [true, false].sample,
        email: Faker::Internet.email,
        password: Faker::Internet.password
})
<<<<<<< HEAD
end
=======

end 
>>>>>>> 90d17340707b157b57972a2b18061d3a32a5efaa

 france = Country.create(name: "France")
 usa = Country.create(name: "USA")
 thailand = Country.create(name: "Thailand")
 vietnam = Country.create(name: "Vietnam")
 cambodia = Country.create(name: "Cambodia")
 mexico = Country.create(name: "Mexico")

paris = City.create({
    name: "Paris",
    country_id: france.id
 })

 new_york = City.create({
    name: "New York",
    country_id: usa.id
 })
 bangkok = City.create({
    name: "Bangkok",
    country_id: thailand.id
 })

 hanoi = City.create({
    name: "Hanoi",
    country_id: vietnam.id
 })

 siem_riep = City.create({
    name: "Siem- Riep",
    country_id: cambodia.id
 })

 tulum = City.create({
    name: "Tulum",
    country_id: mexico.id
 })

10.times do
    Property.create({
        title: Faker::Movies::Hobbit.location,
        address: Faker::Address.street_address,
<<<<<<< HEAD
        city_id: City.all.sample.id,
        host_id:  User.where(host: true).sample.id,
        description: Faker::Quotes::Shakespeare.as_you_like_it_quote
=======
        city: City.all.sample,
        host:  User.where(host: true).sample,
        description: Faker::Quotes::Shakespeare.as_you_like_it_quote 
>>>>>>> 90d17340707b157b57972a2b18061d3a32a5efaa
    })
end

<<<<<<< HEAD
30.times do
    Stay.create({
        property_id: Property.all.sample.id,
        nomad_id:  User.where(host: false).sample.id,
=======
30.times do 
    stay = Stay.create({
        property: Property.all.sample,
        nomad:  User.where(host: false).sample,
>>>>>>> 90d17340707b157b57972a2b18061d3a32a5efaa
        checkin: Faker::Date.between(from: '2020-09-23', to: '2020-11-25'),
        checkout: Faker::Date.between(from: '2020-10-24', to: '2020-12-27')
    })
end

<<<<<<< HEAD
30.times do
    Review.create ({
        property_id: Property.all.sample.id,
        nomad_id:  User.where(host: false).sample.id,
        description: Faker::Restaurant.review,
        rating: [1,2,3,4,5].sample
=======
30.times do 
    review = Review.create({
        nomad_id:  User.where(host: false).sample.id,
        description: Faker::Restaurant.review, 
        rating: [1,2,3,4,5].sample, 
        stay_id: Stay.all.sample.id 
    
>>>>>>> 90d17340707b157b57972a2b18061d3a32a5efaa
    })
end
