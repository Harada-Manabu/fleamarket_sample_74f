require 'rails_helper'
describe User do
  describe '#create' do

    it "必須項目が全て正しく入力されていれば登録できる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがなければ登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "メールアドレスがなければ登録できない" do
      user =  build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "既に登録済みのメールアドレスがある場合は登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("は既に使用されています。")
    end

    it "メールアドレスに@とドメインがなければ登録できない" do
      user = build(:user, email: "testtest")
      user.valid?
      expect(user.errors[:email]).to include("は有効でありません。")
    end

    it "メールアドレスに@があってもドメインがなければ登録できない" do
      user = build(:user, email: "test@test")
      user.valid?
      expect(user.errors[:email]).to include("は有効でありません。")
    end

    it "メールアドレスにドメインがあっても@がなければ登録できない" do
      user = build(:user, email: "test.test")
      user.valid?
      expect(user.errors[:email]).to include("は有効でありません。")
    end

    it "メールアドレスに@とドメインがあれば登録できる" do
      user = build(:user, email: "test@test.test")
      expect(user).to be_valid
    end

    it "パスワードがなければ登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "パスワードが入力されていても確認用が入力されていないと登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "パスワードが6文字以下だと登録できない" do
      user = build(:user, password: "111111", password_confirmation: "11111")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上に設定して下さい。")
    end

    it "パスワードが7文字以上なら登録できる" do
      user = build(:user, password: "2222222", password_confirmation: "2222222")
      expect(user).to be_valid
    end
  end
end