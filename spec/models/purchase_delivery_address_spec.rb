require 'rails_helper'

RSpec.describe PurchaseDeliveryAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_delivery_address = FactoryBot.build(:purchase_delivery_address, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_delivery_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_delivery_address.building_name = ''
        expect(@purchase_delivery_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_delivery_address.postal_code = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_delivery_address.postal_code = '1234567'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが1では登録できない' do
        @purchase_delivery_address.prefecture_id = 1
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'municipalitiesが空だと保存できないこと' do
        @purchase_delivery_address.municipalities = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @purchase_delivery_address.house_number = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @purchase_delivery_address.telephone_number = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9桁以下だと保存できないこと' do
        @purchase_delivery_address.telephone_number = '123456789'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが12桁以上だと保存できないこと' do
        @purchase_delivery_address.telephone_number = '123456789012'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが全角数字だと保存できないこと' do
        @purchase_delivery_address.telephone_number = '０９０１２３４５６７８'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberはハイフンを含んでいると保存できないこと' do
        @purchase_delivery_address.telephone_number = '090-1234-5678'
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @purchase_delivery_address.token = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_delivery_address.user_id = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_delivery_address.item_id = ''
        @purchase_delivery_address.valid?
        expect(@purchase_delivery_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
