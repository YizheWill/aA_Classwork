# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

CATS_COLORS = ['white', 'black', 'orange', 'gray','blue', 'brown']
100.times do 
    Cat.create(name: Faker::Name.name, birth_date: Faker::Date.between(from: '1999-10-10', to: '2020-10-10'), sex: ['M','F'].sample, 
    description: Faker::Lorem.sentences(number: 2), color: CATS_COLORS.sample )
end
