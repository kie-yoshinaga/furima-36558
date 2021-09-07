require 'rails_helper'

RSpec.describe OrderHistoryAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_history_address = FactoryBot.build(:order_history_address, item_id: item.id, user_id: user.id)
    
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
      expect(@order_history_address.errors.full_messages).to include{"postal_code が空欄です"}
    end
    it 'postal_codeは、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
      @order_history_address.postal_code = '１１１１１１１'
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include("Postal code ハイフン(-)を含めてください")
    end
    it 'prefecture_idを入力しなければ登録できない' do
      @order_history_address.prefecture_id = ''
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include{"prefecture_id が空欄です"}
    end
    it 'prefecture_idが１を選択されていた場合は登録できない' do
      @order_history_address.prefecture_id = 1
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include("Prefecture が空欄です")
    end
    it 'cityを入力しなければ登録できない' do
      @order_history_address.city = ''
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include{"city が空欄です"}
    end
    it 'house_numberを入力しなければ登録できない' do
      @order_history_address.house_number = ''
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include{"house_number が空欄です"}
    end
    it 'phone_numberを入力しなければ登録できない' do
      @order_history_address.phone_number = ''
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include{"phone_number が空欄です"}
    end
    it 'phone_numberに半角数字以外が含まれている場合は登録出来ない' do
      @order_history_address.phone_number = '11111１'
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include{"phone_number 半角数字のみで入力してください"}
    end
    it 'phone_numberは10桁以上11桁以内の半角数値のみ保存可能なこと' do
      @order_history_address.phone_number = '１１１１１１１１１１１１'
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include{"phone_number が空欄です"}
    end
    it 'phone_numberは9桁以下の半角数値では登録できない' do
      @order_history_address.phone_number = '11111'
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include{"phone_number が空欄です"}
    end
    it "tokenが空では登録できないこと" do
      @order_history_address.token = ''
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include("Token が空欄です")
    end
    it "ユーザーが紐付いていなければ登録できないこと" do
      @order_history_address.user_id = nil
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include("User が空欄です")
    end
    it "商品が紐付いていなければ登録できないこと" do
      @order_history_address.item_id = nil
      @order_history_address.valid?
      expect(@order_history_address.errors.full_messages).to include("Item が空欄です")
    end
  end
end

