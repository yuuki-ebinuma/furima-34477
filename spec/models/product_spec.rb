require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品出品' do
    before do
      @product = FactoryBot.build(:product)
    end

    it "全ての項目を入力できれば登録できること" do
      expect(@product).to be_valid
    end

    it "商品名が空だと登録できない" do
      @product.product_name = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Product name can't be blank")
    end
    it "商品の説明が空だと登録できない" do
      @product.product_description = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Product description can't be blank")
    end
    it "カテゴリー情報についてが空だと登録できない" do
      @product.category_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    it "商品の状態についてが空だと登録できない" do
      @product.product_status_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Product status can't be blank")
    end
    it "配送料の負担について空だと登録できない" do
      @product.ship_charge_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Ship charge can't be blank")
    end
    it "発送元の地域が空だと登録できない" do
      @product.ship_city_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Ship city can't be blank")
    end
    it "発送までの日数が空だと登録できない" do
      @product.ship_date_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Ship date can't be blank")
    end
    it "販売価格が空だと登録できない" do
      @product.amount_sold = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Amount sold can't be blank")
    end
    it "販売価格が半角数字以外だと登録できない" do
      @product.amount_sold = "１２３４５"
      @product.valid?
      expect(@product.errors.full_messages).to include("Amount sold is not a number")
    end
    it "販売価格が¥300以下だと登録できない" do
      @product.amount_sold = "200"
      @product.valid?
      expect(@product.errors.full_messages).to include("Amount sold must be greater than or equal to 300")
    end
    it "販売価格が¥9999999以上だと登録できない" do
      @product.amount_sold = "10000000"
      @product.valid?
      expect(@product.errors.full_messages).to include("Amount sold must be less than or equal to 9999999")
    end
  end
end
