require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  #以下、正常系のテストコード
  context "商品の出品ができる場合" do
  
    it "全ての項目を基準を満たして入力する" do
      expect(@item).to be_valid
    end
  end

  #以下、異常系のテストコード
  context "商品の出品ができない場合" do
    #商品概要についての項目
    it "画像の添付がないとき" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が空のとき" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が空のとき" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    #アクティブハッシュを用いたものに関する項目
    it "カテゴリーが選択されていないとき" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "商品の状態が選択されていないとき" do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it "配送料の負担が選択されていなとき" do
      @item.postage_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank")
    end
    it "発送元が選択されていなとき" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "発送までの日数が選択されていなとき" do
      @item.arrival_date_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Arrival date can't be blank")
    end

    #販売価格に関する項目
    it "販売価格が空のとき" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "販売価格が300円未満のとき" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "販売価格が9,999,999円より大きいとき" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    #ユーザー情報に関するの項目
    it "ユーザー情報が紐づいていないとき" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank", "User must exist")
    end
  end
end
