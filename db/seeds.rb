# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create some users
3.times do 
  user = User.create!(
    email:    Faker::Internet.email,
    password: 'helloworld',
    role:     'BAND'
  )
  user.skip_confirmation!
  user.save!
end

# Create Bands
4.times do
  Band.create!(
    user: users.sample,  
    name: Faker::Name.name,
    city:   Faker::Address.city, 
    members:  Faker::Number.number(1),
    instruments:  Faker::Number.number(1),
    description: Faker::Lorem.sentence  ,
    genre: Faker::Lorem.word ,
    requirements: Faker::Lorem.sentence  ,
    soundcloud: Faker::Internet.url('soundcloud.com') ,
    facebook: Faker::Internet.url('facebook.com') ,
    website: Faker::Internet.url ,
    phone:  Faker::PhoneNumber.phone_number 
  )
end
bands = Band.all
brock = User.new(
  email: 'brockdonovan@gmail.com',
  password: 'helloworld',
  role:     'BAND'
)
brock.skip_confirmation!
brock.save!

bdon = User.new(
  email: 'bdonovan@barackobama.com',
  password: 'helloworld',
  role:     'VENUE'
)
bdon.skip_confirmation!
bdon.save!

users = User.all

# Create venues
4.times do
  Venue.create!(
    user:   bdon,
    name:  Faker::Name.name, 
    address:  Faker::Address.street_address,
    city:   Faker::Address.city, 
    state:  Faker::Address.state_abbr,
    zip:  Faker::Address.zip_code,
    neighborhood:  Faker::Address.city_suffix,
    phone:  Faker::PhoneNumber.phone_number,
    website:  Faker::Internet.url,
    description:  Faker::Lorem.sentence
  )
end
venues = Venue.all


# Create events
8.times do
  Event.create!(
    venue: venues.sample,  
    title:   Faker::Lorem.word,  
    date:  Faker::Time.between(DateTime.now, DateTime.now+14),
    twentyOne:  [1,0].sample,
    cover: Faker::Number.number(1) ,
    stage: Faker::Lorem.sentence ,
    equipment: Faker::Lorem.sentence  ,
    description: Faker::Lorem.sentence  ,
    other: Faker::Lorem.sentence  ,
    disclaimer: Faker::Lorem.sentence
  )
end
events = Event.all

#Create slots
20.times do
  Slot.create!(
    event: events.sample,  
    time:  Faker::Time.forward(23, :night).strftime("%H:%M"),
    confirmed: true
  )
end
slots = Slot.all

50.times do
  SlotApplication.create!(
    band: bands.sample,
    slot: slots.sample, 
    approved: [1,0].sample
  )
end
slot_applications = SlotApplication.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Venue.count} venues created"
puts "#{Band.count} bands created"
puts "#{Event.count} bands created"
puts "#{Slot.count} slots created"
puts "#{SlotApplication.count} slots created"