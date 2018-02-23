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
    email
  end
end