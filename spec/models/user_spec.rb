require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録機能" do

    context'内容に問題がない場合'do
      it "全ての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "内容に問題がある場合" do
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
      it "emailには、@が含まれている" do
        @user.email = "testexample"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが不一致だと登録できない" do
        @user.password = "test124"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "te124"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは半角英数混合" do
        @user.password = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end
      it "アドレスは一意性" do
        @user.save
        a_user = FactoryBot.build(:user)
        a_user.email =@user.email
        a_user.valid?
        expect(a_user.errors.full_messages).to include("Email has already been taken")
      end
    end

  end
end
