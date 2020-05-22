require 'rails_helper'

describe Good do
  describe '#create' do
    it "すべて入力していると登録できる" do
      user = create(:user)
      category = create(:category)
      good = build(:good, user_id: user.id, category_id: category.id)
      expect(good).to be_valid
    end

    it "brandが空でも登録できる" do
      user = create(:user)
      category = create(:category)
      good = build(:good, brand: "", user_id: user.id, category_id: category.id)
      expect(good).to be_valid
    end

    it "goodsNameが空だと登録できない" do
      user = create(:user)
      category = create(:category)
      good = build(:good, goodsName: "", user_id: user.id, category_id: category.id)
      good.valid?
      expect(good.errors[:goodsName]).to include("を入力してください")
    end

    it "explanationが空だと登録できない" do
      user = create(:user)
      category = create(:category)
      good = build(:good, explanation: "", user_id: user.id, category_id: category.id)
      good.valid?
      expect(good.errors[:explanation]).to include("を入力してください")
    end

    it "categoryが空だと登録できない" do
      user = create(:user)
      good = build(:good, user_id: user.id)
      good.valid?
      expect(good.errors[:category]).to include("を入力してください")
    end

    it "goodsConditionが空だと登録できない" do
      user = create(:user)
      category = create(:category)
      good = build(:good, goodsCondition: "", user_id: user.id, category_id: category.id)
      good.valid?
      expect(good.errors[:goodsCondition]).to include("を入力してください")
    end

    it "deliveryFeeが空だと登録できない" do
      user = create(:user)
      category = create(:category)
      good = build(:good, deliveryFee: "", user_id: user.id, category_id: category.id)
      good.valid?
      expect(good.errors[:deliveryFee]).to include("を入力してください")
    end

    it "prefecture_idが空だと登録できない" do
      user = create(:user)
      category = create(:category)
      good = build(:good, prefecture_id: "", user_id: user.id, category_id: category.id)
      good.valid?
      expect(good.errors[:prefecture_id]).to include("を入力してください")
    end

    it "deliveryDayが空だと登録できない" do
      user = create(:user)
      category = create(:category)
      good = build(:good, deliveryDay: "", user_id: user.id, category_id: category.id)
      good.valid?
      expect(good.errors[:deliveryDay]).to include("を入力してください")
    end

    it "priceが空だと登録できない" do
      user = create(:user)
      category = create(:category)
      good = build(:good, price: nil, user_id: user.id, category_id: category.id)
      good.valid?
      expect(good.errors[:price]).to include("を入力してください")
    end

    it "picturesが空だと登録できない" do
      user = create(:user)
      category = create(:category)
      good = Good.new(
      user_id: user.id,
      category_id:  category.id,
      goodsName: "goodsName",
      explanation: "test explanation",
      brand: "brand",
      goodsCondition: "新品、未使用",
      deliveryFee: "送料込み（出品者負担）",
      prefecture_id: 1,
      deliveryDay: "1~2日で発送",
      price: 100
      )
      good.valid?
      expect(good.errors[:pictures]).to include("を入力してください")
    end

  end
end 