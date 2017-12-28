# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#User.create!(name: 'New Man', password: 'Password', email: 'newman@ex.com', phone: 123-456-7890, dob: '2000-01-01') if Rails.env.development?
User.create!(name: 'Virginia Potts', username: 'whatislove', password: 'babydonthurtme', email: 'whatislove@babydonthurtme.com', phone: '', dob: '1976-03-14') if Rails.env.development?
User.create!(name: 'Jane Foster', username: 'fostersauce', password: 'science!', email: 'fostersaucester@science.com', phone: '123-456-7890', dob: '1989-04-16') if Rails.env.development?
User.create!(name: 'Marina Diamondis', username: 'marinara', password: 'iamnotarobot', email: 'diamondis@marinara.com', phone: '', dob: '1992-06-30') if Rails.env.development?
#AdminUser.create!(email: 'admin@example.com', username: "admin", password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'admin@example.com', username: "admin", password: 'password', password_confirmation: 'password') if Rails.env.development?

Interest.create!([{ name: 'Dog shifts' }, { name: 'Dog transport' }, { name: 'Dog fostering' }, { name: 'Fundraising' }, 
    { name: 'Organizing events'}, { name: 'Cooking/baking' }, { name: 'Machine maintenance' }, { name: 'Cat shifts' }, 
    { name: 'Cat transport' }, { name: 'Cat fostering' }])
