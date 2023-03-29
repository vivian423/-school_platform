# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "creating seeds..."

Activity.destroy_all
Room.destroy_all
Photo.destroy_all
Tag.destroy_all
Chatroom.destroy_all
Kid.destroy_all
User.destroy_all

Meeting.destroy_all
Announcement.destroy_all

# USER
parent = User.create(first_name: "Joy", last_name: "Petterson", password: "123456", email: "parent@parent.com", teacher: false)

parent_paul = User.create(first_name: "Paul", last_name: "Petterson", password: "123456", email: "parent2@parent.com", teacher: false)

parent_three = User.create(first_name: "Fernando", last_name: "Domingo", password: "123456", email: "parent3@parent.com", teacher: false)

teacher = User.create(first_name: " Ms Mary", last_name: "White", password: "123456", email: "teacher@teacher.com", teacher: true)

teacher_ana = User.create(first_name: " Ms Ana", last_name: "Bennett", password: "123456", email: "ana@ana.com", teacher: true)

meeting_one = Meeting.new(
  name: 'Easter holiday - school closed',
  start_time: Time.strptime('04/06/2023 09:00', '%m/%d/%Y %H:%M'),
  end_time: Time.strptime('04/10/2023 15:00', '%m/%d/%Y %H:%M')
)
meeting_one.user = teacher_ana
meeting_one.save!

meeting_two = Meeting.new(
  name: 'Sports day',
  start_time: Time.strptime('04/21/2023 08:00', '%m/%d/%Y %H:%M'),
  end_time: Time.strptime('04/21/2023 15:00', '%m/%d/%Y %H:%M')
)
meeting_two.user = teacher_ana
meeting_two.save!

meeting_three = Meeting.new(
  name: 'Carnival',
  start_time: Time.strptime('09/30/2023 08:00', '%m/%d/%Y %H:%M'),
  end_time: Time.strptime('09/30/2023 15:00', '%m/%d/%Y %H:%M')
)
meeting_three.user = teacher_ana
meeting_three.save!

meeting_four = Meeting.new(
  name: 'Halloween',
  start_time: Time.strptime('10/30/2023 08:00', '%m/%d/%Y %H:%M'),
  end_time: Time.strptime('10/30/2023 15:00', '%m/%d/%Y %H:%M')
 )
meeting_four.user = teacher_ana
meeting_four.save!

meeting_five = Meeting.new(
  name: "Lucy's birthday!",
  start_time: Time.strptime('03/31/2023 08:00', '%m/%d/%Y %H:%M'),
  end_time: Time.strptime('03/31/2023 15:00', '%m/%d/%Y %H:%M')
 )
meeting_five.user = teacher_ana
meeting_five.save!

# KIDS
max = Kid.create(
  first_name: 'Max',
  last_name: 'Ortega'
)

lucy = Kid.create(
  first_name: 'Lucy',
  last_name: 'Ortega'
)

brad = Kid.create(
  first_name: 'Brad',
  last_name: 'Soon'
)

# PARENTS
parent_relationship_a = Parent.new
parent_relationship_a.user_id = parent.id
parent_relationship_a.kid_id = max.id
parent_relationship_a.save!

parent_relationship_b = Parent.new
parent_relationship_b.user_id = parent_paul.id
parent_relationship_b.kid_id = max.id
parent_relationship_b.save!

parent_relationship_c = Parent.new
parent_relationship_c.user_id = parent_paul.id
parent_relationship_c.kid_id = lucy.id
parent_relationship_c.save!

parent_relationship_d = Parent.new
parent_relationship_d.user_id = parent.id
parent_relationship_d.kid_id = lucy.id
parent_relationship_d.save!

parent_relationship_e = Parent.new
parent_relationship_e.user_id = parent_three.id
parent_relationship_e.kid_id = brad.id
parent_relationship_e.save!

# FIRST KID PHOTO
file = URI.open('https://images.unsplash.com/flagged/photo-1551600466-464bbbbd15f9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
max.photo.attach(io: file, filename: "avatar.png", content_type: "image/png")
max.save


# ACTIVITIES
first_seed = Activity.new(
  bowel_movement: 1,
  nap_duration: 120,
  snack: 'Ham with cheese',
  snack_consumption: 'all',
  lunch_consumption: 'most',
  lunch: 'Vegetable soup',
  date: Time.strptime('03/20/2023 17:00', '%m/%d/%Y %H:%M'),
  overall_mood: 'normal'
)
first_seed.kid = max
first_seed.user = teacher
first_seed.save!

second_seed = Activity.new(
  bowel_movement: 2,
  nap_duration: 150,
  snack: 'Cookies with whole milk',
  lunch: 'Ham and cheese sandwich, with side of cut oranges',
  snack_consumption: 'all',
  lunch_consumption: 'all',
  date: Time.strptime('03/21/2023 17:00', '%m/%d/%Y %H:%M'),
  overall_mood: 'More easily irritated'
)
second_seed.kid = max
second_seed.user = teacher
second_seed.save!

third_seed = Activity.new(
  bowel_movement: 1,
  nap_duration: 120,
  snack: 'Peanut butter and apples',
  lunch: 'Tomato soup and chicken pasta',
  date: Time.strptime('03/22/2023 17:00', '%m/%d/%Y %H:%M'),
  snack_consumption: 'little',
  lunch_consumption: 'most',
  overall_mood: 'Happy overall'
)
third_seed.kid = max
third_seed.user = teacher_ana
third_seed.save!

fourth_seed = Activity.new(
  bowel_movement: 0,
  nap_duration: 120,
  snack: 'Kiwi and yogurt',
  lunch: 'Spaghetti and meatballs',
  date: Time.strptime('03/23/2023 17:00', '%m/%d/%Y %H:%M'),
  snack_consumption: 'most',
  lunch_consumption: 'all',
  overall_mood: 'Happy overall'
)
fourth_seed.kid = max
fourth_seed.user = teacher_ana
fourth_seed.save!

fifth_activity = Activity.new(
  bowel_movement: 1,
  nap_duration: 100,
  snack: 'Banana and yoghurt',
  lunch: 'Chicken and beans with rice',
  date: Time.strptime('03/24/2023 17:00', '%m/%d/%Y %H:%M'),
  snack_consumption: 'most',
  lunch_consumption: 'most',
  overall_mood: 'Happy overall'
)
fifth_activity.kid = max
fifth_activity.user = teacher
fifth_activity.save!

sixth_activity = Activity.new(
  bowel_movement: 1,
  nap_duration: 120,
  snack: 'Oatmeal cookie and whole milk',
  lunch: 'Baked hake with rice',
  date: Time.strptime('03/27/2023 17:00', '%m/%d/%Y %H:%M'),
  snack_consumption: 'all',
  lunch_consumption: 'little',
  overall_mood: 'Happy overall'
)

sixth_activity.kid = max
sixth_activity.user = teacher
sixth_activity.save!

seventh_activity = Activity.new(
  bowel_movement: 0,
  nap_duration: 110,
  snack: 'Yoghurt and banana',
  lunch: 'Pulled pork sandwich',
  date: Time.strptime('03/28/2023 17:00', '%m/%d/%Y %H:%M'),
  snack_consumption: 'most',
  lunch_consumption: 'most',
  overall_mood: 'Happy overall'
)

seventh_activity.kid_id = max.id
seventh_activity.user = teacher
seventh_activity.save!

eighth_activity = Activity.new(
  bowel_movement: 1,
  nap_duration: 120,
  snack: 'Cheese croissant',
  lunch: 'Meatloaf and mashed potatoes',
  date: Time.strptime('03/29/2023 17:00', '%m/%d/%Y %H:%M'),
  snack_consumption: 'all',
  lunch_consumption: 'all',
  overall_mood: 'Happy overall'
)
eighth_activity.kid_id = max.id
eighth_activity.user = teacher
eighth_activity.save!

ninth_activity = Activity.new(
  bowel_movement: 2,
  nap_duration: 115,
  snack: 'Banana and yoghurt',
  lunch: 'Chicken and beans fried rice',
  date: Time.strptime('03/30/2023 17:00', '%m/%d/%Y %H:%M'),
  snack_consumption: 'all',
  lunch_consumption: 'most',
  overall_mood: 'Happy and active overall'
)
ninth_activity.kid_id = max.id
ninth_activity.user = teacher
ninth_activity.save!

tenth_activity = Activity.new(
  bowel_movement: 1,
  nap_duration: 115,
  snack: 'Ham and cheese croissant',
  lunch: 'Salmon and spaghetti',
  date: Time.strptime('03/31/2023 17:00', '%m/%d/%Y %H:%M'),
  snack_consumption: 'all',
  lunch_consumption: 'little',
  overall_mood: 'Happy overall'
)
tenth_activity.kid_id = max.id
tenth_activity.user = teacher
tenth_activity.save!

room_seed = Room.new(
  name: 'Precious gems'
)
room_seed.kid = max
room_seed.user = teacher
room_seed.save!

  # twor_seed = Room.new(
  # name: 'Golden elephant'
  # )

  # twor_seed.kid = kid_two
  # twor_seed.user = teacher
  # twor_seed.save

  # threer_seed = Room.new(
  #   name: 'Sweet panda'
  # )
  # threer_seed.kid = kid_three
  # threer_seed.user = teacher_ana
  # threer_seed.save

  # fourr_seed = Room.new(
  #   name: 'Delicious penguine'
  # )
  # fourr_seed.kid = kid_four
  # fourr_seed.user = teacher
  # fourr_seed.save

  # fiver_seed = Room.new(
  #   name: 'Silver monkey'
  # )
chatroom_max = Chatroom.new(name: "Max's chatroom")
chatroom_max.kid = max
chatroom_max.save!

chatroom_lucy = Chatroom.new(name: "Lucy's chatroom")
chatroom_lucy.kid = lucy
chatroom_lucy.save!

chatroom_brad = Chatroom.new(name: "Brad's chatroom")
chatroom_brad.kid = brad
chatroom_brad.save!

firsta_seed = Announcement.new(
  title: 'Parents-teacher personal meeting',
  content: 'We are happy to announce that first Parents-teacher meeting of the year is in next month. Send us message if the date and time suits to you or not',
  date: Time.strptime('04/15/2023 17:00', '%m/%d/%Y %H:%M')
)
firsta_seed.user = parent_paul
firsta_seed.save

seconda_seed = Announcement.new(
  title: 'Annual day',
  content: 'All parents are invited in the Annual day that is going to happen in our auditorium.',
  date: Time.strptime('04/30/2023 16:00', '%m/%d/%Y %H:%M')
)
seconda_seed.user = parent
seconda_seed.save
thirda_seed = Announcement.new(
  title: 'Photo-session day',
  content: 'All the parents are inforemed that we are    oraganising a photo-session day so all kids should be in nice and fine clothes with the theme of yellow color.',date: Time.strptime('03/28/2023 09:00', '%m/%d/%Y %H:%M')
)
thirda_seed.user = parent
thirda_seed.save

fourtha_seed = Announcement.new(
  title: 'Welcome day for Miss Polly',
  content: 'We are happy to announce that a new teacher, named Miss Polly is going to join our kindergarten.',
  date: Time.strptime('04/01/2023 08:00', '%m/%d/%Y %H:%M')
)
fourtha_seed.user = teacher
fourtha_seed.save

fiftha_seed = Announcement.new(
  title: 'Easter Holiday',
  content: 'Due to the occasion of Easter, kindergarten will be closed for 4 days.',
  date: Time.strptime('03/31/2023 11:00', '%m/%d/%Y %H:%M')
)
fiftha_seed.user = teacher
fiftha_seed.save

sixtha_seed = Announcement.new(
  title: 'Changes in lunch time',
  content: 'We are changing the lunch time that was earlier 12pm. Now it would be from 11am.',
  date: Time.strptime('01/01/2023 11:00', '%m/%d/%Y %H:%M')
)
sixtha_seed.user = parent
sixtha_seed.save

seventha_seed = Announcement.new(
  title: 'Changes in pickup time',
  content: 'Due to lack of teachers, we are reducing the kindergartens timings. It is now from 8am to 2 pm.',
  date: Time.strptime('10/10/2023 08:00', '%m/%d/%Y %H:%M')
)
seventha_seed.user = parent
seventha_seed.save

eightha_seed = Announcement.new(
  title: 'Welcome day for a new kid',
  content: 'Its being pleasure to announce that a new kid, named Tom Anderson is ready to join our kindergarten very soon. We are eagerly waiting for him.',
  date: Time.strptime('05/01/2023 09:00', '%m/%d/%Y %H:%M')
)
eightha_seed.user = teacher
eightha_seed.save

nintha_seed = Announcement.new(
  title: 'Repairing work in outer area',
  content: 'Due to repairing work in outer front area, this is request from the parents to use back area to drop and pick the kids.',
  date: Time.strptime('03/27/2023 08:00', '%m/%d/%Y %H:%M')
)
nintha_seed.user = parent
nintha_seed.save

tentha_seed = Announcement.new(
  title: 'Now its Easter soon',
  content: 'As the Easter is coming soon so all kids must bring a yellow box with them, made up of glass.',
  date: Time.strptime('03/29/2023 12:00', '%m/%d/%Y %H:%M')
)
tentha_seed.user = parent
tentha_seed.save

photos_array = [
   "https://images.unsplash.com/photo-1587616211892-f743fcca64f9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGtpbmRlcmdhcnRlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGtpZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1597413545419-4013431dbfec?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGtpZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1503919545889-aef636e10ad4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGtpZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1524503033411-c9566986fc8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGtpZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1600880291319-1a7499c191e8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGtpbmRlcmdhcnRlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1516627145497-ae6968895b74?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGtpZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1630465651806-09682f8364b5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGtpbmRlcmdhcnRlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1564429238817-393bd4286b2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8a2luZGVyZ2FydGVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1567746455504-cb3213f8f5b8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80.jpg",
   "https://images.unsplash.com/photo-1620398722262-969d8f2bc875?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8a2luZGVyZ2FydGVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60.jpg",
   "https://plus.unsplash.com/premium_photo-1661380944248-8236fc4b3899?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGtpbmRlcmdhcnRlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1541692641319-981cc79ee10a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGtpbmRlcmdhcnRlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1601339434203-130259102db6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGtpbmRlcmdhcnRlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60.jpg",
   "https://plus.unsplash.com/premium_photo-1663108227137-807e0096af81?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGtpbmRlcmdhcnRlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60.jpg",
   "https://plus.unsplash.com/premium_photo-1661385843328-bc92c32529c2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fGtpbmRlcmdhcnRlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60.jpg"
]
counter = 0
photos_array.each do |photo_url|
  file = URI.open(photo_url)
  photo = Photo.create
  photo.photo.attach(io: file, filename: "kids_" + counter.to_s + ".png", content_type: "image/png")
  photo.save
  counter += 1
end


puts "... seeds created ..."
