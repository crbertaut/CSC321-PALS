# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

Interest.create!([{ name: 'Dog shifts' }, { name: 'Dog transport' }, { name: 'Dog fostering' }, { name: 'Fundraising' }, 
    { name: 'Organizing events'}, { name: 'Cooking/baking' }, { name: 'Machine maintenance' }, { name: 'Cat shifts' }, 
    { name: 'Cat transport' }, { name: 'Cat fostering' }])

if Rails.env.development?
    AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

    user1 = User.create!(name: 'Rocky Williams', home_email: 'rockyrd@example.com', password: 'password', home_phone: '(641) 895-5555', dob:'1990-01-25', bio: 'We own two dogs at home!')
    user1.interests << (Interest.find_by name: 'Dog shifts')
    
    user1.shifts.create!(kind: 0, start: "2018-04-05 15:00:00", finish: "2018-04-05 15:30:00")
    user1.shifts.create!(kind: 0, start: "2018-04-06 15:00:00", finish: "2018-04-06 15:30:00")
    user1.shifts.create!(kind: 0, start: "2018-04-06 17:00:00", finish: "2018-04-06 18:30:00")
    user1.shifts.create!(kind: 0, start: "2018-04-09 15:00:00", finish: "2018-04-09 15:30:00")
    
    User.first.donations.create!(amount: 50)
    User.first.donations.create!(amount: 100)
    User.first.donations.create!(amount: 25)
    
    
    user2 = User.create!(name: 'Matilda Simmion', home_email: 'msims@example.com', password: 'password', home_phone: '(641) 894-3365', dob:'1990-07-10', bio: 'I have volunteered at PALS for 10 years now--it is a wonderful place to volunteer at.')

    user2.interests << (Interest.find_by name: 'Organizing events')
    user2.interests << (Interest.find_by name: 'Cat fostering')
    user2.interests << (Interest.find_by name: 'Cat shifts')
    user2.interests << (Interest.find_by name: 'Cat transport')
    user2.interests << (Interest.find_by name: 'Dog shifts')
    user2.interests << (Interest.find_by name: 'Dog transport')
    user2.interests << (Interest.find_by name: 'Cooking/baking')
    user2.interests << (Interest.find_by name: 'Machine maintenance')
    
    User.second.donations.create!(amount: 50)
    User.second.donations.create!(amount: 100)
    User.second.donations.create!(amount: 25)
    
    User.create!(name: 'Virginia Potts', password: 'babydonthurtme', home_email: 'whatislove@babydonthurtme.com', home_phone: '', dob: '1976-03-14')
    User.create!(name: 'Jane Foster', password: 'science!', home_email: 'fostersaucester@science.com', home_phone: '(123) 456-7890', dob: '1989-04-16')
    User.create!(name: 'Marina Diamondis', password: 'iamnotarobot', home_email: 'diamondis@marinara.com', home_phone: '', dob: '1992-06-30')

end

