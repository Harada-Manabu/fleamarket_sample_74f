require 'rails_helper'
describe CreditCard do
  describe '#create' do
    it "全て存在すれば登録できること" do
      user = create(:user)
      credit_card = build(:credit_card, user_id: user.id)
      expect(credit_card).to be_valid
    end
  end
end