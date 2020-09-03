require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.build(:user)
    @item = FactoryBot.create(:item, user_id: user_id)
    @item.image = fixture_file_upload('/IMG_5140.jpg','image/jpg')
  end
  describe '出品商品の保存' do
    context '出品ができる時' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品ができない時' do
      it '出品画像の項目が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_message).to include("Image can't be blank")
      end
      it '商品名の項目が空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_message).to include("Name can't be blank")
      end
      it '商品の説明の項目が空だと出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_message).to include("Description can't be blank")
      end
      it 'カテゴリーの項目が空だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_message).to include("Category can't be blank")
      end
      it '商品の状態の項目が空だと出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_message).to include("Status can't be blank")
      end
      it '配送料の負担の項目が空だと出品できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_message).to include("Burden can't be blank")
      end
      it '発送元の地域の項目が空だと出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_message).to include("Area can't be blank")
      end
      it '発送までの日数の項目が空だと出品できない' do
        @itme.days_id = 1
        @item.valid?
        expect(@item.errors.full_message).to include("Day can't be blank")
      end
      it '販売価格の項目が空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@itme.errors.full_message).to include("Price can't be blank")
      end
      it '販売価格が300円未満だと出品できない' do
        @itme.price = 299
        @item.valid?
        expect(@item.errors.full_message).to include("Price is out of setting range")
      end
      it '販売価格が9999999円より大きいと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_message).to include("Price is out of setting range")
      end
      it '販売価格に全角数字が存在すると出品できない' do
        @item.price = １０００００
        @item.valid?
        expect(@item.errors.full_message).to include("Price is out of setting range")
      end
    end
  end
end