require 'rails_helper'
RSpec.describe ItemOrder, type: :model do
  before do
    @user = FactoryBot.create(:user) #フォームオブジェクトを用いているため先@user,@itemを作る必要がある
    @item = FactoryBot.create(:item)
    @item_order = FactoryBot.build(:item_order , user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  #以下、正常系のテストコード
  context "商品が購入できるとき" do
  
    it "建物名がなくても購入できる" do
      @item_order.buillding = "" 
      expect(@item_order).to be_valid
    end

    it "全ての項目を基準を満たして入力する" do
      expect(@item_order).to be_valid
    end
  end

  #以下、異常系のテストコード
  context "商品が購入できないとき" do
    #カード情報についての項目
    it "トークンが生成されないとき" do
      @item_order.token = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Token can't be blank")
    end

    #郵送先に関する項目
    it "郵便番号が空のとき" do
      @item_order.postal_code = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it "郵便番号にハイフンがないのとき" do
      @item_order.postal_code = "0000000"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Postal code is invalid")
    end
    it "都道府県が選択されていないとき" do
      @item_order.prefecture_id = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "市町村が空のとき" do
      @item_order.city = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("City can't be blank")
    end
    it "番地が空のとき" do
      @item_order.house_number = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("House number can't be blank")
    end
    it "電話番号が空のとき" do
      @item_order.phone_number = ""
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号にハイフンがあるとき" do
      @item_order.phone_number = "000-00-00000"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number is not a number")
    end
    it "電話番号が12桁以上あるとき" do
      @item_order.phone_number = "000000000000"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end

    #購入者および商品に関する項目
    it "ユーザー情報が紐づいてないとき" do
      @item_order.user_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("User can't be blank")
    end
    it "商品情報が紐づいてないとき" do
      @item_order.item_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Item can't be blank")
    end
  end
end
