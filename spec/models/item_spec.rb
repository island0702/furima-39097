require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録' do
    context '出品登録できる場合' do
      it "nameとimageとdetailとcategory_idとcondition_idと
      shipping_cost_idとarea_of_origin_idとselling_priceと
      estimated_sipping_date_idが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '出品が出来ない場合' do
      it 'userが紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空では登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end

      it 'カテゴリーの情報が[---]では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it '商品の状態の情報が[---]では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end

      it '配送料の負担の情報が[---]では登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost Select')
      end

      it '発送元の地域の情報が[---]では登録できない' do
        @item.area_of_origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Area of origin Select')
      end

      it '価格の情報が空では登録できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end

      it '価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.selling_price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be greater than or equal to 300')
      end

      it '価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.selling_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be less than or equal to 9999999')
      end

      it '価格は半角数値のみ保存可能であること' do
        @item.selling_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end

      it '発送までの日数の情報が[---]では登録できない' do
        @item.estimated_sipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Estimated sipping date Select')
      end
    end
  end
end
