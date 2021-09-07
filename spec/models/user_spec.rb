require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザ登録に成功する場合' do
    it 'nicknameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_reading、first_name_reading、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = '12345a'
      @user.password_confirmation = '12345a'
      expect(@user).to be_valid
    end
  end

  context 'ユーザ登録に失敗する場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it "emailに@がないと登録できない" do
      @user.email = "kkkgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      end
    it 'passwordは半角英数字での入力でなければ登録できない' do
      @user.password = '123456'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字を含めてください")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '12345a'
      @user.password_confirmation = '12346a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードは英字のみでは登録できないこと" do
      @user.password = 'aaaaaa'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字を含めてください")
    end
    it "パスワードは全角文字では登録できないこと" do
      @user.password = '１２３４５Ａ'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字を含めてください")
    end
    it "名前が空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "名字が空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角で入力してください")
    end
    it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角で入力してください")
    end
    it "フリガナ（名前）が空だと登録できない" do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end
    it "フリガナ（名字）が空だと登録できない" do
      @user.last_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank")
    end
    it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.first_name_reading = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end
    it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.last_name_reading = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank")
    end
    it "生年月日が空だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end