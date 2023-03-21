# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Kid.destroy_all
User.destroy_all
Event.destroy_all
# USER
user_one = User.create(first_name: "Joy", last_name: "Petterson", password: "123456", email: "joyadc@gmail.com")

user_two = User.create(first_name: "Marry", last_name: "Giampaolo", password: "123456", email: "giovanni@gmail.com")

user_three = User.create(first_name: "John", last_name: "Lumaca", password: "123456", email: "joaquin@gmail.com", teacher: "true")

user_four = User.create(first_name: "Tom", last_name: "Bennett", password: "123456", email: "bennett@gmail.com", teacher: "true")


first_seed = Event.create(
  event_title: 'Easter',
  event_start_date: DateTime.parse("04/02/2023 8:00"),
  event_end_date: DateTime.parse("04/08/2009 14:00"),
  event_description: 'Easter Egg Lace Card, Egg and Spoon Race, Eggs for Fun, Easter Coloring Eggs Activity.'
)

second_seed = Event.create(
  event_title: 'Sports day',
  event_start_date: DateTime.parse("06/10/2023 10:00"),
  event_end_date: DateTime.parse("06/10/2023 16:00"),
  event_description: 'Gymnastics, Swimming, Biking, Karate, Soccer.'
)

third_seed = Event.create(
  event_title: 'Carnival',
  event_start_date: DateTime.parse("09/24/2023 10:00"),
  event_end_date: DateTime.parse("09/29/2023 18:00"),
  event_description: 'Popcorn counting printable, Elephant toothpaste explosion experiment, Carnival alphabet sensory bin.'
)

fourth_seed = Event.create(
  event_title: 'Halloween',
  event_start_date: DateTime.parse("10/31/2023 14:00"),
  event_end_date: DateTime.parse("10/31/2023 17:00"),
  event_description: 'Skeleton Letters, Halloween Writing Center, Halloween Color Clip, Trick-or-Treat Numbers.'
)


# KIDS
kid_one = Kid.create(
  kid_first_name: 'Jacob',
  kid_last_name: 'Murati'
)

kid_two = Kid.create(
  kid_first_name: 'Mark',
  kid_last_name: 'Begu'
)

kid_three = Kid.create(
  kid_first_name: 'Lucas',
  kid_last_name:
)

kid_four = Kid.create(
  kid_first_name: 'William',
  kid_last_name: 'Kola'
)

kid_five = Kid.create(
  kid_first_name: 'Mona',
  kid_last_name: 'Laci'
)

# ACTIVITIES
first_seed = Activity.new(
  activity_bowel_movement: 'Good'
  activity_nap_duration: 1,
  activity_snack: 'Bread with cheese',
  activity_lunch: 'Vegetable soup',
  activity_overall_mood: 'Happy'
)
  first_seed.kid = kid_one
  first_seed.user = user_one
  first_seed.save


 second_seed = Activity.new(
   activity_bowel_movement: 'Not so good'
   activity_nap_duration: 1,
   activity_snack: 'Bread with cheese',
   activity_lunch: 'Hot dog',
   activity_overall_mood: 'Annoying'
  )

  second_seed.kid = kid_two
  second_seed.user = user_two
  second_seed.save


  third_seed = Activity.new(
    activity_bowel_movement: 'Bad'
    activity_nap_duration: 2,
    activity_snack: 'Bread with cheese',
    activity_lunch: 'Tomato soup',
    activity_overall_mood: 'Bad'
  )
   third_seed.kid = kid_three
   third_seed.user = user_three
   third_seed.save


    fourth_seed = Activity.new(
      activity_bowel_movement: 'Good'
      activity_nap_duration: 3,
      activity_snack: 'Bread with cheese',
      activity_lunch: 'Tomato soup',
      activity_overall_mood: 'Happy'
    )

    fourth_seed.kid = kid_four
    fourth_seed.user = user_four
    fourth_seed.save



      fifth_seed = Activity.new(
        activity_bowel_movement: 'Good'
        activity_nap_duration: 2,
        activity_snack: 'Bread with cheese',
        activity_lunch: 'Hot dog',
        activity_overall_mood: 'Happy'
      )

      fifth_seed.kid = kid_five
      first_seed.user = user_five
      fifth_seed.save

      kid_five = Kid.create
