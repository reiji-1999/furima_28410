require 'rails_helper'
RSpec.describe BuyerManagement, type: :model do
  describe '購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item, user_id: seller.id)
      item.image = fixture_file_upload('/laptop-1478822_640.jpg', 'image/jpg')
      item.save
      sleep 3
      @buyermanagement = FactoryBot.build(:buyer_management, user_id: buyer.id, item_id: item.id)
    end
    context '購入ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyermanagement).to be_valid
      end
      it '電話番号10桁で登録できる' do
        @buyermanagement.phonenumber = "0901234567"
        expect(@buyermanagement).to be_valid
      end
      it '電話番号11桁で登録できる' do
        @buyermanagement.phonenumber = "09012345678"
        expect(@buyermanagement).to be_valid
      end
      it '建物名は空でも保存できること' do
        @buyermanagement.buildingname = nil
        expect(@buyermanagement).to be_valid
      end
    end
    context '購入ができないとき' do
      it '郵便番号が空だと保存できないこと' do
        @buyermanagement.postalcode = nil
        @buyermanagement.valid?
        expect(@buyermanagement.errors.full_messages).to include("Postalcode can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyermanagement.postalcode = '1234567'
        @buyermanagement.valid?
        expect(@buyermanagement.errors.full_messages).to include("Postalcode is invalid")
      end
      it '都道府県を選択していないと保存できないこと' do
        @buyermanagement.area_id = 1
        @buyermanagement.valid?
        expect(@buyermanagement.errors.full_messages).to include("Area must be other than 1")
      end
      it '市町村が空だと保存できないこと' do
        @buyermanagement.city = nil
        @buyermanagement.valid?
        expect(@buyermanagement.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @buyermanagement.housenumber = nil
        @buyermanagement.valid?
        expect(@buyermanagement.errors.full_messages).to include("Housenumber can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @buyermanagement.phonenumber = nil
        @buyermanagement.valid?
        expect(@buyermanagement.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it '電話番号が12桁以上だと登録できない' do
        @buyermanagement.phonenumber = "090123456789"
        @buyermanagement.valid?
        expect(@buyermanagement.errors.full_messages).to include("Phonenumber is too long (maximum is 11 characters)")
      end
      it '電話番号が9桁以下だと登録できない' do
        @buyermanagement.phonenumber = "090123456"
        @buyermanagement.valid?
        expect(@buyermanagement.errors.full_messages).to include("Phonenumber is too short (minimum is 10 characters)")
      end
      it 'tokenの情報がないと保存ができない' do
        @buyermanagement.token = nil
        @buyermanagement.valid?
        expect(@buyermanagement.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end