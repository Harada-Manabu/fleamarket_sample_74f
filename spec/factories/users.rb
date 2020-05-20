FactoryBot.define do
  
  factory :user do
    nickname              {"testes"}
    email                 {"test@test.test"}
    password              {"1111111"}
    password_confirmation {"1111111"}
  end
end