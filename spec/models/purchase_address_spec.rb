require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    sleep(1)
    # FactoryBot.create（:user)を使って出品者と購入者を作る
    buyer = FactoryBot.create(:user)
    seller = FactoryBot.create(:user)
    # FactoryBot.create(:item, user_id: @user1.id)（出品）
    @purchase = FactoryBot.create(:item, user_id: seller.id)
    # FactoryBot.build(:purchase_address, item_id: ,user_id: )（購入）
    @purchase_address = FactoryBot.build(:purchase_address, item_id: @purchase.id, user_id: buyer.id)
  end

  describe '#create' do
    context 'アドレス登録がうまくいくとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@purchase_address).to be_valid
      end
    end

    context 'アドレス登録がうまくいかないとき' do
      it '郵便番号が存在しないと保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県（カテゴリー）の情報が0だと保存できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '市区町村が存在しないと保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が存在しないと保存できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が存在しないと保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '郵便番号には-がないと保存できない' do
        @purchase_address.postal_code = '1111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '電話番号はハイフンがあると保存できない' do
        @purchase_address.phone_number = '111-1111-1111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が11桁以上だと保存できない' do
        @purchase_address.phone_number = '111111111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
