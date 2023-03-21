# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Activity.destroy_all
Room.destroy_all
Kid.destroy_all
User.destroy_all
Event.destroy_all


# USER
user_one = User.create(first_name: "Joy", last_name: "Petterson", password: "123456", email: "joyadc@gmail.com", teacher: false)

user_two = User.create(first_name: "Marry", last_name: "Giampaolo", password: "123456", email: "giovanni@gmail.com", teacher: false)

user_three = User.create(first_name: "John", last_name: "Lumaca", password: "123456", email: "joaquin@gmail.com", teacher: true)

user_four = User.create(first_name: "Tom", last_name: "Bennett", password: "123456", email: "bennett@gmail.com", teacher: true)


firste_seed = Event.create(
  title: 'Easter',
  start_date: Time.strptime('06/30/2023 08:00', '%m/%d/%Y %H:%M'),
  end_date: Time.strptime('06/30/2023 15:00', '%m/%d/%Y %H:%M'),
  description: 'Easter Egg Lace Card, Egg and Spoon Race, Eggs for Fun, Easter Coloring Eggs Activity.'
)

seconde_seed = Event.create(
  title: 'Sports day',
  start_date: Time.strptime('08/30/2023 08:00', '%m/%d/%Y %H:%M'),
  end_date: Time.strptime('08/30/2023 15:00', '%m/%d/%Y %H:%M'),
  description: 'Gymnastics, Swimming, Biking, Karate, Soccer.'
)

thirde_seed = Event.create(
  title: 'Carnival',
  start_date: Time.strptime('09/30/2023 08:00', '%m/%d/%Y %H:%M'),
  end_date: Time.strptime('09/30/2023 15:00', '%m/%d/%Y %H:%M'),
  description: 'Popcorn counting printable, Elephant toothpaste explosion experiment, Carnival alphabet sensory bin.'
)

fourthe_seed = Event.create(
  title: 'Halloween',
  start_date: Time.strptime('10/30/2023 08:00', '%m/%d/%Y %H:%M'),
  end_date: Time.strptime('10/30/2023 15:00', '%m/%d/%Y %H:%M'),
  description: 'Skeleton Letters, Halloween Writing Center, Halloween Color Clip, Trick-or-Treat Numbers.'
)


# KIDS
kid_one = Kid.create(
  first_name: 'Jacob',
  last_name: 'Murati'
)

kid_two = Kid.create(
  first_name: 'Mark',
  last_name: 'Begu'
)

kid_three = Kid.create(
  first_name: 'Lucas',
  last_name: 'Petterson'
)

kid_four = Kid.create(
  first_name: 'William',
  last_name: 'Kola'
)

kid_five = Kid.create(
  first_name: 'Mona',
  last_name: 'Laci'
)

# ACTIVITIES
first_seed = Activity.new(
  bowel_movement: 'Good',
  nap_duration: 1,
  snack: 'Bread with cheese',
  lunch: 'Vegetable soup',
  overall_mood: 'Happy'
)
  first_seed.kid = kid_one
  first_seed.user = user_one
  first_seed.save


 second_seed = Activity.new(
   bowel_movement: 'Not so good',
   nap_duration: 1,
   snack: 'Chocochips with milk',
   lunch: 'Hot dog',
   overall_mood: 'Annoying'
  )

  second_seed.kid = kid_one
  second_seed.user = user_two
  second_seed.save


  third_seed = Activity.new(
    bowel_movement: 'Bad',
    nap_duration: 2,
    snack: 'Bread with cheese',
    lunch: 'Tomato soup',
    overall_mood: 'Bad'
  )
   third_seed.kid = kid_three
   third_seed.user = user_three
   third_seed.save


    fourth_seed = Activity.new(
      bowel_movement: 'Good',
      nap_duration: 3,
      snack: 'Bread with cheese',
      lunch: 'Tomato soup',
      overall_mood: 'Happy'
    )
      fourth_seed.kid = kid_four
      fourth_seed.user = user_four
      fourth_seed.save

      fifth_seed = Activity.new(
        bowel_movement: 'Good',
        nap_duration: 2,
        snack: 'Bread with cheese',
        lunch: 'Hot dog',
        overall_mood: 'Happy'
      )

      fifth_seed.kid = kid_five
      fifth_seed.save

     #ROOM
      oner_seed = Room.new(
        name: 'Precious gems'
      )
      oner_seed.kid = kid_one
      oner_seed.user = user_one
      oner_seed.save

      twor_seed = Room.new(
        name: 'Golden elephant'
      )

      twor_seed.kid = kid_two
      twor_seed.user = user_two
      twor_seed.save

      threer_seed = Room.new(
        name: 'Sweet panda'
      )
      threer_seed.kid = kid_three
      threer_seed.user = user_three
      threer_seed.save

      fourr_seed = Room.new(
        name: 'Delicious penguine'
      )
      fourr_seed.kid = kid_four
      fourr_seed.user = user_four
      fourr_seed.save

      fiver_seed = Room.new(
        name: 'Silver monkey'
      )

      fiver_seed.kid = kid_five
      fiver_seed.save

      #Announcements
      firsta_seed = Announcement.new(
        title: '',
        content: ''
      )
      firsta_seed.user = user_one
      firsta_seed.save

      seconda_seed = Announcement.new(
        title: '',
        content: ''
      )
      seconda_seed.user = user_two
      seconda_seed.save

      thirda_seed = Announcement.new(
        title: '',
        content: ''
      )
      thirda_seed.user = user_three
      thirda_seed.save

      fourtha_seed = Announcement.new(
        title: '',
        content: ''
      )
      fourtha_seed.user = user_four
      fourtha_seed.save
