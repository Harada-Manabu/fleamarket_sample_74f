require 'rails_helper'
describe CreditCard do
  describe '#create' do
    it "user_idが無い場合は登録できないこと" do
      credit_card = CreditCard.new(user_id: "", customer_id: "cus_123334444frg33rff", card_id: "car_kfjfd4456j90fji")
    end
  end
end