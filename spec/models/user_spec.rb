require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録/ユーザー情報" do
    before do
      @user = FactoryBot.build(:user)
    end

    it "全ての項目を入力できれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailに@がないとと登録できない" do
      @user.email = "test.gmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "emailが一意性でないと登録できない" do
      @user.save
      another_user = FactoryBot.build(:user,email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "確認用のpasswordが空だと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが5文字以下では登録できない" do
      @user.password = "Ebi00"
      @user.encrypted_password = "Ebi00"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが半角英数字混合でないと登録できない" do
      @user.password = "aiueoaiueo"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "ユーザーの名字が空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "ユーザーの名前が空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザーの名字は全角でないと登録できない" do
      @user.last_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "ユーザーの名前は全角でないと登録できない" do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "ユーザーの名字のフリガナが空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "ユーザーの名字のフリガナは全角でないと登録できない" do
      @user.last_name_kana = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "ユーザーの名前のフリガナは全角でないと登録できない" do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "ユーザーの名前のフリガナが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("first name kana can't be blank")
    end
    it "生年月日が空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
