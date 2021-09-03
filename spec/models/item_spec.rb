require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    # @item.image = fixture_file_upload('app/assets/images/star.png')
  end

  context '商品登録に成功する場合' do
    it '必須項目が全てあれば登録できること' do
      expect(@item).to be_valid
    end
    it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
      @item = FactoryBot.create(:user)
      expect(@item).to be_valid
    end
  end

  context '商品登録に失敗する場合' do
    it '商品画像を1枚つけなければ登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include{"Image can't be blank"}
    end
    it 'titleが空では登録できない' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it 'catch_copyが空では登録できない' do
      @item.catch_copy = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Catch copy can't be blank")
    end
    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'condition_idが空では登録できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it 'postage_idが空では登録できない' do
      @item.postage_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank")
    end
    it 'shipping_date_idが空では登録できない' do
      @item.shipping_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date can't be blank")
    end
    it 'category_id、condition_id、postage_id、shipping_date_idが１を選択されていた場合は登録できない' do
      @item.category_id = '1'
      @item.condition_id = '1'
      @item.postage_id = '1'
      @item.shipping_date_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank")
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number", "Price Out of setting range")
    end
    it 'priceは半角数字でなければ登録できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number", "Price Out of setting range")
    end
    it '半角英数混合では登録できないこと' do
      @item.price = '111a'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number", "Price Out of setting range")
    end
    it '半角英語だけでは登録できないこと' do
      @item.price = 'aaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number", "Price Out of setting range")
    end
    it 'priceは全角数字では登録できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number", "Price Out of setting range")
    end
    it '売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it '売価格は、¥9,999,999を超えると出品できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it 'userが紐付いていなければ出品できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end