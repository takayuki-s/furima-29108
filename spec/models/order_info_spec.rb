require 'rails_helper'

RSpec.describe OrderInfo, type: :model do
  describe '購入情報の保持' do
    before do
      buyer = FactoryBot.create(:user)
      seller = FactoryBot.create(:user, email: 'aaaa111@gmail.com')
      item = FactoryBot.build(:item, user_id: seller.id)
      item.image = fixture_file_upload('app/assets/images/star.png')
      item.save
      @order_info = FactoryBot.build(:order_info, user_id: buyer.id, item_id: item.id)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_info).to be_valid
    end
    it '建物名（building）が空でも登録できること' do
      @order_info.building = nil
      expect(@order_info).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @order_info.post_number = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include("Post number can't be blank")
    end
    it '郵便番号にハイフンがないと保存できないこと' do
      @order_info.post_number = '1234567'
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include('Post number is invalid. Include hyphen(-)')
    end
    it '郵便番号にハイフンの位置を間違えると保存できないこと' do
      @order_info.post_number = '12-34567'
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include('Post number is invalid. Include hyphen(-)')
    end
    it '都道府県を選択しないと保存できないこと' do
      @order_info.prefecture_id = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include("Prefecture can't be blank")
    end
    it '市町村が空だと保存できないこと' do
      @order_info.address = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include("Address can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @order_info.tel = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include("Tel can't be blank")
    end
    it '電話番号は半角数字以外で入力すると保存できないこと' do
      @order_info.tel = '０９０１２３４５６７８'
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include('Tel is invalid')
    end
    it '電話番号は11桁以内でないと保存できないこと' do
      @order_info.tel = '090123456789'
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include('Tel is too long (maximum is 11 characters)')
    end
    it 'トークンが空では登録できないこと' do
      @order_info.token = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include("Token can't be blank")
    end
    it '購入者（user_id）が空では登録できないこと' do
      @order_info.user_id = nil
      sleep 1
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include("User can't be blank")
    end
    it '商品（item_id）が空では登録できないこと' do
      @order_info.item_id = nil
      sleep 1
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include("Item can't be blank")
    end
  end
end
