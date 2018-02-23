FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryBot.define do
  factory :user do
    name 'Gwen Poole'
    username 'gwenpool'
    password 'gutterspace'
    dob '2016-01-01'
    bio "You're all just comic book characters in my world!"
    email
  end
end