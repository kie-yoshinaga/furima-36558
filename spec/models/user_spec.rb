RSpec.describe User, type: :model do
end

describe '新規登録/ユーザー情報' do
  it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
    expect(@user).to be_valid
  end
  it 'nicknameが空では登録できない' do
    @user.name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Name can't be blank")
  end
  it 'emailが空では登録できない' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it '重複したemailが存在する場合登録できない' do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end
  it 'passwordが空では登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'passwordが5文字以下では登録できない' do
    @user.password = '12345'
    @user.password_confirmation = '12345'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end
  it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
    @user.password = '123456'
    @user.password_confirmation = '123456'
    expect(@user).to be_valid
  end
  it 'passwordは半角英数字での入力でなければ登録できない' do
    @user.password = "aaaaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
  end
  it 'passwordとpassword_confirmationが不一致では登録できない' do
    @user.password = '123456'
    @user.password_confirmation = '1234567'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
end

describe '新規登録/本人情報確認' do
  it "名字が空だと登録できない" do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First_name can't be blank")
  end
  it "名前が空だと登録できない" do
    @user.family_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Family_name can't be blank")
  end
  it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
    @user.first_name = "kana"
    @user.valid?
    expect(@user.errors.full_messages).to include("First_name Full-width characters")
  end
  it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
    @user.family_name = "kana"
    @user.valid?
    expect(@user.errors.full_messages).to include("Family_name Full-width characters")
  end
  it "フリガナ（名字）が空だと登録できない" do
    @user.first_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
  end
  it "フリガナ（名前）が空だと登録できない" do
    @user.family_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Family_name_kana can't be blank")
  end
  it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
    @user.first_name = "kana"
    @user.valid?
    expect(@user.errors.full_messages).to include("First_name Full-width characters")
  end
  it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
    @user.family_name = "kana"
    @user.valid?
    expect(@user.errors.full_messages).to include("Family_name Full-width characters")
  end
end