FactoryBot.define do
  
  factory :delivery_address do
    familyName     {"振間"}
    firstName      {"太郎"}
    familyNameKana {"ふりま"}
    firstNameKana  {"たろう"}
    postCode       {"1234567"}
    prefecture_id  {"1"}
    city           {"渋谷区"}
    address        {"渋谷町１−１−１"}
    buildingName   {"渋谷ビル１０F"}
    telNumber      {"0312345678"}
  end
end