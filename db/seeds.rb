# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#User.create!(name: 'New Man', password: 'Password', email: 'newman@ex.com', phone: 123-456-7890, dob: '2000-01-01') if Rails.env.development?
Interest.create!([{ name: 'Dog feeding' }, { name: 'Dog playing' }, { name: 'Dog grooming' }, { name: 'Fundraising' }, 
    { name: 'Organizing events'}, { name: 'Cooking/baking' }, { name: 'Machine maintenance' }, { name: 'Dog walking' },
    { name: 'Dog cleaning' }, { name: 'Cat playing' }, { name: 'Cat feeding' }, { name: 'Cat cleaning' }])
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
