require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
  end

  describe '商品新規購入登録' do
    context '商品新規購入登録できる場合' do
      it 'address、municipality、post_code、telephone_number、area_of_origin_id、tokenとが存在すれば登録できる' do
        expect(@buy_address).to be_valid
      end
    end
    context '商品新規登録できない場合' do
      it '郵便番号が必須であること。' do
        @buy_address.post_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンの記述が必須であること。' do
        @buy_address.post_code = 1_111_111
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Post code is invalid')
      end
      it '電話番号が必須であること。' do
        @buy_address.telephone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号には9桁以上が必須であること。' do
        @buy_address.telephone_number = 111_111_111
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号には12桁以内が必須であること。' do
        @buy_address.telephone_number = 111_111_111_111
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号には半角入力が必須であること。' do
        @buy_address.telephone_number = '１１１１１１１１１１１'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it '市区町村が必須であること。' do
        @buy_address.municapality = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Municapality can't be blank")
      end
      it '住所の情報が必須であること。' do
        @buy_address.address = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address can't be blank")
      end
      it '都道府県の情報が必須であること。' do
        @buy_address.area_of_origin_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include
      end

      it "tokenが空では登録できないこと" do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
