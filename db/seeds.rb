5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
  )
  user.update_attributes!(confirmed_at: Time.now)
end
users = User.all

10.times do
  registered_application = RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Company.name,
  )
  registered_application.update_attributes!(created_at: 10.days.ago)
end
registered_applications = RegisteredApplication.all

20.times do
  event = Event.create!(
    registered_application: registered_applications.sample,
    name: Faker::Hipster.sentence
  )
end
events = Event.all

puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered_applications created"
puts "#{Event.count} events created"
puts "Seed finished"
puts "Some seeds fell beside the road, and the birds came and ate them up..."
