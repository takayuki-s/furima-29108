require 'rails_helper'

RSpec.describe OrderInfo, type: :model do
  describe '購入情報の保持' do
    before do
      @order_info = FactoryBot.build(:order_info)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_info).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @order_info.post_number = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include("Post number can't be blank")
    end
    it '郵便番号にハイフンがないと保存できないこと' do
      @order_info.post_number = "1234567"
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include("Post number is invalid. Include hyphen(-)")
    end
    it 'name_readingが空だと保存できないこと' do
    end
    it '郵便番号にハイフンの位置を間違えると保存できないこと' do
      @order_info.post_number = "12-34567"
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include("Post number is invalid. Include hyphen(-)")
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
      @order_info.tel = "０９０１２３４５６７８"
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include("Tel is invalid")
    end
    it 'トークンが空では登録できないこと' do
      @order_info.token = nil
      @order_info.valid?
      expect(@order_info.errors.full_messages). to include("Token can't be blank")
    end
  end
end