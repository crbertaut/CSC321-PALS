# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(firstname: 'Me', lastname: 'Myself', password: 'Password', email: 'andI@example.com', phone: 123-456-7890, dob: '2000-01-01') if Rails.env.development?
Post.create!(title: 'Say something. Anything', thread_type: 'Other', date: '2017-06-25', description: 'est 1, 2, 3... Anything but that') if Rails.env.development?
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?