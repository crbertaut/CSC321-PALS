FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :phone do |n|
    s = n.to_s
    "(#{s*3}) #{s*3}-#{s*4}"
  end
end

FactoryBot.define do
  factory :user do
    name 'Gwen Poole'
    home_phone { generate(:phone) }
    work_phone { generate(:phone) }
    email { generate(:email) }
    password '12345678'
    password_confirmation '12345678'
    gender 3
    contact_method 0
    latitude 41.748601
    longitude (-92.720604)
  end
end