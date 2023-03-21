# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

User.destroy_all
Kid.destroy_all

puts "creating seeds..."
@teacher = User.create(email: "teacher@teacher.com", password: "123456", first_name: "Ms Mar", last_name: "Jones", teacher: true)
@parent = User.create(email: "vivian@vivian.com", password: "123456", first_name: "Vivian", last_name: "Chan", teacher: false)

@max = Kid.create(first_name: "Maxwell", last_name: "Ortega")


puts "...finished seeds"
