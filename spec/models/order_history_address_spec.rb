require 'rails_helper'

RSpec.describe OrderHistoryAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_history_address = FactoryBot.build(:order_history_address, item_id: item.id, user_id: user.id)
    #@order_history_address.image = fixture_file_upload('app/assets/images/star.png')
    sleep 0.3
  end

  context '商品購入に成功する場合' do
    it '必須項目が全てあれば登録できること' do
      expect(@order_history_address).to be_valid
    end
    it "tokenがあれば保存ができること" do
      expect(@order_history_address).to be_valid
    end
    it 'building_nameは空でも登録できること' do
      @order_history_address.building_name = ''
      expect(@order_history_address).to be_valid
    end
  end

  context '商品購入に失敗する場合' do
    it 'postal_codeを入力しなければ登録できない' do
      @order_history_address.postal_code = ''
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include{"postal_code can't be blank"}
    end
    it 'postal_codeは、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
      @order_history_address.postal_code = '１１１１１１１'
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefecture_idを入力しなければ登録できない' do
      @order_history_address.prefecture_id = ''
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include{"prefecture_id can't be blank"}
    end
    it 'prefecture_idが１を選択されていた場合は登録できない' do
      @order_history_address.prefecture_id = '1'
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityを入力しなければ登録できない' do
      @order_history_address.city = ''
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include{"city can't be blank"}
    end
    it 'house_numberを入力しなければ登録できない' do
      @order_history_address.house_number = ''
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include{"house_number can't be blank"}
    end
    it 'phone_numberを入力しなければ登録できない' do
      @order_history_address.phone_number = ''
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include{"phone_number can't be blank"}
    end
    it 'phone_numberは10桁以上11桁以内の半角数値のみ保存可能なこと' do
      @order_history_address.phone_number = '１１１１１１１１１１１１'
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include{"phone_number can't be blank"}
    end
    it 'phone_numberは9桁以下の半角数値では登録できない' do
      @order_history_address.phone_number = '11111'
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include{"phone_number can't be blank"}
    end
    it "tokenが空では登録できないこと" do
      @order_history_address.token = ''
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include("Token can't be blank")
    end
    it "ユーザーが紐付いていなければ登録できないこと" do
      @order_history_address.user_id = nil
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include("User can't be blank")
    end
    it "商品が紐付いていなければ登録できないこと" do
      @order_history_address.item_id = nil
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end

