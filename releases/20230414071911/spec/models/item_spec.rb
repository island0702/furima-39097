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
        expect(@item.errors.full_messages).to include("ユーザーを入力してください")
      end

      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品の説明が空では登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end

      it 'カテゴリーの情報が[---]では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリー選択")
      end

      it '商品の状態の情報が[---]では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("状態選択")
      end

      it '配送料の負担の情報が[---]では登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料選択")
      end

      it '発送元の地域の情報が[---]では登録できない' do
        @item.area_of_origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("地域選択")
      end

      it '価格の情報が空では登録できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格数値の範囲内で入力してください", "販売価格は数値で入力してください")
      end

      it '価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.selling_price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end

      it '価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.selling_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end

      it '価格は半角数値のみ保存可能であること' do
        @item.selling_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end

      it '発送までの日数の情報が[---]では登録できない' do
        @item.estimated_sipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送日選択")
      end
    end
  end
end
