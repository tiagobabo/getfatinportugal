# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
["Drinks", "Desserts", "Main Course", "Starters"].each do |cat|
  Category.find_or_create_by_name(cat)
end


  User.find_or_create_by_email(:email => 'sexta.feira.13@gmail.com', :remember_me => 0, :password => 'qwerty12', :password_confirmation => 'qwerty12', :first_name => 'Sergio', :last_name => 'Monteiro', :nickname => 'sexta13')
  User.find_or_create_by_email(:email => 'luis.bivar@gmail.com', :remember_me => 0, :password => 'qwerty12', :password_confirmation => 'qwerty12', :first_name => 'Luis', :last_name => 'Ramos', :nickname => 'lbramos')
  User.find_or_create_by_email( :email => 'rsneves@gmail.com', :remember_me => 0, :password => 'qwerty12', :password_confirmation => 'qwerty12', :first_name => 'Rui', :last_name => 'Neves', :nickname => 'rsneves')