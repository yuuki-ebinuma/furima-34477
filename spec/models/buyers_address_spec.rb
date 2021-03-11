require 'rails_helper'

RSpec.describe BuyersAddress, type: :model do
  describe '購入者情報' do
    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.build(:product)
      @product.user.email = 'email@com'
      @product.save
      @buyers_address = FactoryBot.build(:buyers_address,user_id:@user.id,product_id:@product.id)
      sleep 0.1
    end

    context '購入者情報が登録できるとき' do
      it "全ての項目を入力できれば登録できること" do
        expect(@buyers_address).to be_valid
      end
    end

    context '購入者情報が登録できないとき' do
      it "郵便番号が空だと登録できない" do
        @buyers_address.postal_code = ""
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it "都道府県が空だと登録できない" do
        @buyers_address.ship_region = ""
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Ship region can't be blank")
      end
      it "市区町村が空だと登録できない" do
        @buyers_address.ship_address = ""
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Ship address can't be blank")
      end
      it "番地が空だと登録できない" do
        @buyers_address.ship_city_id = ""
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Ship city can't be blank")
      end
      it "電話番号が空だと登録できない" do
        @buyers_address.phone = ""
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Phone can't be blank")
      end
      it "郵便番号のハイフンがないと登録できない" do
        @buyers_address.postal_code = "123456"
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Postal code is invalid")
      end
      it "電話番号は11桁以内の数値でないと登録できない" do
        @buyers_address.phone = "090398087671"
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Phone is invalid")
      end
    end

    context "クレジット決済情報" do
      it "クレジット決済情報が空だと登録できない" do
        @buyers_address.token = ""
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end