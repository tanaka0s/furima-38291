require 'rails_helper'

RSpec.describe OrderPurchaser, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_purchaser = FactoryBot.build(:order_purchaser, user_id: user.id, item_id: item.id)
    sleep 0.2
  end
  describe '商品購入' do
    context '商品を購入できる場合' do
      it '全ての項目が正しく入力されていれば購入できる' do
        expect(@order_purchaser).to be_valid
      end
      it '建物名は空でも購入できる' do
        @order_purchaser.building = ''
        expect(@order_purchaser).to be_valid
      end
    end
    context '商品を購入できない場合' do
      it 'tokenが空では購入できないこと' do
        @order_purchaser.token = nil
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では購入できない' do
        @order_purchaser.user_id = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order_purchaser.item_id = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空では購入できない' do
        @order_purchaser.post_code = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が「3桁ハイフン4桁」ではない場合は購入できない' do
        @order_purchaser.post_code = '1234567'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '都道府県が空では購入できない' do
        @order_purchaser.prefecture_id = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "都道府県が'---'では購入できない" do
        @order_purchaser.prefecture_id = 1
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では購入できない' do
        @order_purchaser.city = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @order_purchaser.house_number = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空では購入できない' do
        @order_purchaser.phone_number = ''
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が10桁未満では購入できない' do
        @order_purchaser.phone_number = '123456789'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Phone number is too short')
      end
      it '電話番号が12桁以上では購入できない' do
        @order_purchaser.phone_number = '012345678912'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it '電話番号に半角数値以外が含まれている場合は購入できない' do
        @order_purchaser.phone_number = '090-123-4567'
        @order_purchaser.valid?
        expect(@order_purchaser.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
    end
  end
end
