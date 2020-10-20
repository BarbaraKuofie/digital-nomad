# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# User 
 - name 
 - host => boolean => default = false 

 # Property 
 - title 
 - address 
 - city_id 
 - host_id 
 - description 


# Stay 
- property_id 
- nomad_id 
- checkin
- checkout

#  Review 
 - property_id 
 - nomad_id 
 - description 
 - rating 1-5 

 # City 
 - name 
 - country_id 

 # Country 
 - name 
 
## User Stories 
- A host can create a property to the site (done - Tom )
- A host can update their listing with the new information (working on it -Tom)
- A host can delete a property from the site (working on it - Tom)
- Nomads can write a review on a property (done - Barbara)
- All users can view a property's reviews on it's show page (barbara)
- Nomads can remove a review on a property  (barbara)
-Nomads can arrage stays on a property 
- A property should have an assigned city and country 

--To Do As We Find Them 
- On sign-up users should be able to select if they are a host or a nomad 