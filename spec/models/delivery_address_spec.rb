require 'rails_helper'
describe DeliveryAddress do
  describe "#create" do
    
  it "項目に全て正しく入力されていれば登録できる" do
    delivery_address = build(:delivery_address)
    expect(delivery_address).to be_valid
  end

  it "必須項目のみ入力されていれば登録できる" do
    delivery_address = build(:delivery_address, buildingName: nil, telNumber: nil)
    expect(delivery_address).to be_valid
  end

  it "名字がなければ登録できない" do
    delivery_address = build(:delivery_address, familyName: nil)
    delivery_address.valid?
    expect(delivery_address.errors[:familyName]).to include("を入力してください")
  end

  it "名前がなければ登録できない" do
    delivery_address = build(:delivery_address, firstName: nil)
    delivery_address.valid?
    expect(delivery_address.errors[:firstName]).to include("を入力してください")
  end

  it "名字（かな）がなければ登録できない" do
    delivery_address = build(:delivery_address, familyNameKana: nil)
    delivery_address.valid?
    expect(delivery_address.errors[:familyNameKana]).to include("を入力してください")
  end

  it "名前（かな）がなければ登録できない" do
    delivery_address = build(:delivery_address, firstName: nil)
    delivery_address.valid?
    expect(delivery_address.errors[:firstName]).to include("を入力してください")
  end

  it "名字（かな）がひらがなでなければ登録できない" do
    delivery_address = build(:delivery_address, familyNameKana: "振間")
    delivery_address.valid?
    expect(delivery_address.errors[:familyNameKana]).to include("はひらがなで入力してください")
  end

  it "名前（かな）がひらがなでなければ登録できない" do
    delivery_address = build(:delivery_address, firstNameKana: "太郎")
    delivery_address.valid?
    expect(delivery_address.errors[:firstNameKana]).to include("はひらがなで入力してください")
  end

  it "郵便番号がなければ登録できない" do
    delivery_address = build(:delivery_address, postCode: nil)
    delivery_address.valid?
    expect(delivery_address.errors[:postCode]).to include("を入力してください")
  end

  it "郵便番号が7文字以外だと登録できない" do
    delivery_address = build(:delivery_address, postCode: "12345678")
    delivery_address.valid?
    expect(delivery_address.errors[:postCode]).to include("は7文字で入力してください")
  end

  it "郵便番号が7文字だと登録できる" do
    delivery_address = build(:delivery_address, postCode: "1234567")
    expect(delivery_address).to be_valid
  end

  it "都道府県を選択していないと登録できない" do
    delivery_address = build(:delivery_address, prefecture_id: nil)
    delivery_address.valid?
    expect(delivery_address.errors[:prefecture_id]).to include("を入力してください")
  end

  it "市区町村を選択していないと登録できない" do
    delivery_address = build(:delivery_address, city: nil)
    delivery_address.valid?
    expect(delivery_address.errors[:city]).to include("を入力してください")
  end

  it "番地を選択していないと登録できない" do
    delivery_address = build(:delivery_address, address: nil)
    delivery_address.valid?
    expect(delivery_address.errors[:address]).to include("を入力してください")
  end
  end
end