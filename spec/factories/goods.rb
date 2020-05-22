FactoryBot.define do
  factory :good do
    goodsName {"goodsName"}
    explanation {"test explanation"}
    brand {"brand"}
    goodsCondition {"新品、未使用"}
    deliveryFee {"送料込み（出品者負担）"}
    prefecture_id {1}
    deliveryDay {"1~2日で発送"}
    price {100}
    pictures {[
      FactoryBot.build(:picture, good: nil)
    ]}
  end
end 