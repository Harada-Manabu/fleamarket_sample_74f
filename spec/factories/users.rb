FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {1111111}
    password_confirmation {1111111}
  end
end 
