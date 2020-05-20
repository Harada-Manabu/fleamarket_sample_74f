require 'rails_helper'
describe CreditCard do
  describe '#create' do
    it "外部キーのuser_id存在すれば登録できること" do
      user = create(:user)
      credit_card = build(:credit_card, user_id: user.id)
      expect(credit_card).to be_valid
    end
    
    it "外部キーのuser_idがなければ登録できないこと" do
      credit_card = build(:credit_card)
      credit_card.valid?
      expect(credit_card.errors[:user]).to include("を入力してください")
    end

  end
end