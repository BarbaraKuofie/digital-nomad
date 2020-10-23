# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
# User.destroy_all
# Country.destroy_all
# City.destroy_all
# Property.destroy_all
# Review.destroy_all
# Stay.destroy_all

75.times do
    User.create({
        name: Faker::Name.unique.name,
        host: [true, false].sample,
        email: Faker::Internet.email,
        password: Faker::Internet.password
})

end

 france = Country.create(name: "France")
 usa = Country.create(name: "USA")
 thailand = Country.create(name: "Thailand")
 vietnam = Country.create(name: "Vietnam")
 cambodia = Country.create(name: "Cambodia")
 mexico = Country.create(name: "Mexico")
 italy = Country.create(name: "Italy")
 england = Country.create(name: "England")

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
    name: "Siem Riep",
    country_id: cambodia.id
 })

 tulum = City.create({
    name: "Tulum",
    country_id: mexico.id
 })

 nice = City.create({
    name: "Nice",
    country_id: france.id
 })

 chicago = City.create({
    name: "Chicago",
    country_id: usa.id
 })
 chiang_mai = City.create({
    name: "Chiang Mai",
    country_id: thailand.id
 })

 da_nang = City.create({
    name: "Da Nang",
    country_id: vietnam.id
 })

 phnom_penh = City.create({
    name: "Phnom Penh",
    country_id: cambodia.id
 })

 mc = City.create({
    name: "Mexico City",
    country_id: mexico.id
 })

 rome = City.create({
    name: "Rome",
    country_id: italy.id
 })

 los_angeles = City.create({
    name: "Los Angeles",
    country_id: usa.id
 })
 miami = City.create({
    name: "Miami",
    country_id: usa.id
 })

 london = City.create({
    name: "London",
    country_id: england.id
 })

 milan = City.create({
    name: "Milan",
    country_id: italy.id
 })

 liverpool = City.create({
    name: "Liverpool",
    country_id: england.id
 })

40.times do
    Property.create({
        title: Faker::Address.unique.community,
        address: Faker::Address.street_address,
        city: City.all.sample,
        host:  User.where(host: true).sample,
        description: Faker::Quotes::Shakespeare.as_you_like_it_quote
    })
end

#past_stays
30.times do
    stay = Stay.create({
        property: Property.all.sample,
        nomad:  User.where(host: false).sample,
        checkin: Faker::Date.between(from: '2020-05-23', to: '2020-10-20'),
        checkout: Faker::Date.between(from: '2020-05-24', to: '2020-10-21')
    })
end

#current_stays
20.times do
    stay = Stay.create({
        property: Property.all.sample,
        nomad:  User.where(host: false).sample,
        checkin: Faker::Date.between(from: '2020-10-15', to: '2020-10-21'),
        checkout: Faker::Date.between(from: '2020-10-24', to: '2020-10-27')
    })
end

#future_stays
30.times do
    stay = Stay.create({
        property: Property.all.sample,
        nomad:  User.where(host: false).sample,
        checkin: Faker::Date.between(from: '2020-10-23', to: '2020-12-31'),
        checkout: Faker::Date.between(from: '2020-10-24', to: '2020-12-31')
    })
end

50.times do
    review = Review.create({
        nomad_id:  User.where(host: false).sample.id,
        description: Faker::Restaurant.review,
        rating: [1,2,3,4,5].sample,
        stay_id: Stay.all.sample.id

    })
end
