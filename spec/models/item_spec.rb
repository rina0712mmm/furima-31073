require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '#create' do
    context '商品登録がうまくいくとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it '商品画像が存在しないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が存在しないと保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が存在しないと保存できない' do
        @item.item_detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item detail can't be blank")
      end
      it 'カテゴリーの情報が0だと保存できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it '商品の状態についての情報が存在しないと保存できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 0')
      end
      it '配送料の負担についての情報が存在しないと保存できない' do
        @item.postage_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage must be other than 0')
      end
      it '発送元の地域についての情報が存在しないと保存できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '発送までの日数についての情報が存在しないと保存できない' do
        @item.days_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 0')
      end
      it '価格についての情報が存在しないと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が¥300~¥9,999,999の間でないと保存できない' do
        @item.price = '10'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格が半角数字ではないと保存できない' do
        @item.price = 'aAあああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
