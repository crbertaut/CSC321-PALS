# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

Interest.create!([{ name: 'Dog shifts' }, { name: 'Dog transport' }, { name: 'Dog fostering' }, { name: 'Fundraising' }, 
    { name: 'Organizing events'}, { name: 'Cooking/baking' }, { name: 'Machine maintenance' }, { name: 'Cat shifts' }, 
    { name: 'Cat transport' }, { name: 'Cat fostering' }])

if Rails.env.development?
    user1 = User.create!(name: 'Rocky Williams', email: 'rockyrd@example.com', password: 'password', phone: '(641) 895-5555', dob:'1990-01-25', username: 'RockyRoad', bio: 'We own two dogs at home!')
    user1.interests << (Interest.find_by name: 'Dog shifts')
    
    user2 = User.create!(name: 'Matilda Simmion', email: 'msims@example.com', password: 'password', phone: '(641) 894-3365', dob:'1990-07-10', username: 'Sims', bio: 'I have volunteered at PALS for 10 years now--it is a wonderful place to volunteer at.')
    user2.interests << (Interest.find_by name: 'Organizing events')
    user2.interests << (Interest.find_by name: 'Cat fostering')
    user2.interests << (Interest.find_by name: 'Cat shifts')
    user2.interests << (Interest.find_by name: 'Cat transport')
    user2.interests << (Interest.find_by name: 'Dog shifts')
    user2.interests << (Interest.find_by name: 'Dog transport')
    user2.interests << (Interest.find_by name: 'Cooking/baking')
    user2.interests << (Interest.find_by name: 'Machine maintenance')
    
    User.create!(name: 'Virginia Potts', username: 'whatislove', password: 'babydonthurtme', email: 'whatislove@babydonthurtme.com', phone: '', dob: '1976-03-14')
    User.create!(name: 'Jane Foster', username: 'fostersauce', password: 'science!', email: 'fostersaucester@science.com', phone: '(123) 456-7890', dob: '1989-04-16')
    User.create!(name: 'Marina Diamondis', username: 'marinara', password: 'iamnotarobot', email: 'diamondis@marinara.com', phone: '', dob: '1992-06-30')
    
    user1.posts << (Post.create!(title: 'Need a ride!', thread_type: 'Ride', description: 'I am from the college and don\'t have a car. Can anyone give me a lift this Sunday?', date: '2017-12-09'))
    user2.posts << (Post.create!(title: 'Help for Rib Dinner next month?', thread_type: 'Other', description: 'PALS Rib Dinner will be next month on January 31. If anyone is interested in helping out with organzing, cooking, or serving, please reply to this post!', date: '2018-01-31'))
    user2.posts << (Post.create!(title: 'Shift swap Friday!!', thread_type: 'Shift', description: 'I can no longer make it to my 5pm cat shift this Friday. Is anyone willing to swap or cover?', date: '2017-12-08'))

    AdminUser.create!(email: 'admin@example.com', username: "admin", password: 'password', password_confirmation: 'password')
end

