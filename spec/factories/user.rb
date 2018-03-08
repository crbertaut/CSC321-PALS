FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryBot.define do
  factory :user, :class => 'User' do
    username 'gwenpool'
    name 'Gwen Poole'
    email
    password '12345678'
    password_confirmation '12345678'
    gender 3
  end
end