require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/star.png')
  end

  describe '商品の保存' do
    context '商品が保存できる場合' do
      it '全ての項目が正しく入力されていれば、商品は保存される' do
        expect(@item).to be_valid
      end
    end
    context '商品が保存できない場合' do
      it '商品名がないと、商品は保存されない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '画像がないと、商品は保存されない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品の説明がないと、商品は保存されない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'カデコリーが選択されていないと、商品は保存されない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が選択されていないと、商品は保存されない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '発送量の負担が選択されていないと、商品は保存されない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it '発送元の地域が選択されていないと、商品は保存されない' do
        @item.shipment_source_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source can't be blank")
      end
      it '発送までの日数が選択されていないと、商品は保存されない' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it '価格がないと、商品は保存されない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '価格が300〜9,999,999の間で入力されていないと、商品は保存されない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格が半角数字で入力されていないと、商品は保存されない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
