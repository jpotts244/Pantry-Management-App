# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jackie = User.create({name: "Jackie", email: "jackie@test.com", password: "hello"})

category = Category.create({category_name: "fruits"})

apple = Food.create({user_id: jackie.id, category_id: category.id, food_name: "apple",quantity: "5 lbs", expiration: "2015-09-20"})