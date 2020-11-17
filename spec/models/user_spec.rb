require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  #以下は正常系のテストコード
  context "新規ユーザー登録ができる場合" do
  
    it "全ての項目を基準を満たして入力する" do
      expect(@user).to be_valid
    end
    
  end
  #以下は異常系のテストコード
  context "ユーザー新規登録出来ない場合" do
    #ニックネームに関する項目
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      #emailに関する項目
      it "emailが空だと登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailアドレスは登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken", "Email has already been taken")
      end
      it "emailアドレスに@を含まないと登録できないこと" do
        @user.email = @user.email.delete("@")
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      #パスワードに関する項目
      it "passwordが空だと登録できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下だと登録できないこと" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordを半角英数混合でないと登録できないこと" do
        @user.password = "１23456"
        @user.password_confirmation = "１23456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが確認を含めて入力しないといけないこと" do
        @user.password = "12345a"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが一致しないと登録できないこと" do
        @user.password = "12345a"
        @user.password_confirmation = "12345z"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      #名前に関する項目
      it "family_nameが空だと登録できないこと" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
      end
      it "family_nameが全角漢字、ひらがな、カタカナでないと登録できないこと" do
        @user.family_name = "Ab1２"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "first_nameが空だと登録できないこと" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "first_nameが全角漢字、ひらがな、カタカナでないと登録できないこと" do
        @user.first_name = "Ab1２"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      #誕生日に関する項目
      it "birthdayが空だと登録できないこと" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
  end
end

  