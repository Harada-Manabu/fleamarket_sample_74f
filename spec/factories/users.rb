FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(8)}
    password_confirmation {Faker::Internet.password(8)}
  end
end 