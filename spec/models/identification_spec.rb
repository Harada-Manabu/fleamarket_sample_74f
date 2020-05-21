require 'rails_helper'
describe Identification do
  describe '#create' do
    
  it "必須項目が全て正しく入力されていれば登録できる" do
    identification = build(:identification)
    expect(identification).to be_valid
  end

  it "名字がなければ登録できない" do
    identification = build(:identification, familyName: nil)
    identification.valid?
    expect(identification.errors[:familyName]).to include("を入力してください")
  end

  it "名前がなければ登録できない" do
    identification = build(:identification, firstName: nil)
    identification.valid?
    expect(identification.errors[:firstName]).to include("を入力してください")
  end

  it "名字が全角でなければ登録できない" do
    identification = build(:identification, familyName: "hurima")
    identification.valid?
    expect(identification.errors[:familyName]).to include("は全角で入力してください")
  end

  it "名前がなければ登録できない" do
    identification = build(:identification, firstName: "taro")
    identification.valid?
    expect(identification.errors[:firstName]).to include("は全角で入力してください")
  end

  it "名字（かな）がなければ登録できない" do
    identification = build(:identification, familyNameKana: nil)
    identification.valid?
    expect(identification.errors[:familyNameKana]).to include("を入力してください")
  end

  it "名前（かな）がなければ登録できない" do
    identification = build(:identification, firstNameKana: nil)
    identification.valid?
    expect(identification.errors[:firstNameKana]).to include("を入力してください")
  end

  it "名字（かな）が全角でなければ登録できない" do
    identification = build(:identification, familyNameKana: "hurima")
    identification.valid?
    expect(identification.errors[:familyNameKana]).to include("は全角ひらがなで入力してください")
  end

  it "名前（かな）が全角でなければ登録できない" do
    identification = build(:identification, firstNameKana: "taro")
    identification.valid?
    expect(identification.errors[:firstNameKana]).to include("は全角ひらがなで入力してください")
  end

  it "名字（かな）がひらがなでなければ登録できない" do
    identification = build(:identification, familyNameKana: "振間")
    identification.valid?
    expect(identification.errors[:familyNameKana]).to include("は全角ひらがなで入力してください")
  end

  it "名前（かな）がひらがなでなければ登録できない" do
    identification = build(:identification, firstNameKana: "太郎")
    identification.valid?
    expect(identification.errors[:firstNameKana]).to include("は全角ひらがなで入力してください")
  end
  end
end