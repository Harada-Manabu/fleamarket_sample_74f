require 'rails_helper'
describe Identification do
  describe '#create' do
    
  it "必須項目が全て正しく入力されていれば登録できる" do
    identification = build(:identification)
    expect(identification).to be_valid
  end

  end
end