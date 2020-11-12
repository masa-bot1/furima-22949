require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '購入情報の保存' do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_purchase).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @user_purchase.postal_code = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_purchase.postal_code = '1234567'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code is invalid")
    end

    it 'prefectureを選択していないと保存できないこと' do
      @user_purchase.prefecture_id = 0
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it 'cityが空だと保存できないこと' do
      @user_purchase.city = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("City can't be blank")
    end

    it 'street_numberが空だと保存できないこと' do
      @user_purchase.street_number = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Street number can't be blank")
    end

    it 'building_nameは空でも保存できること' do
      @user_purchase.building_name = nil
      expect(@user_purchase).to be_valid
    end

    it 'phone_numberが空だと保存できないこと' do
      @user_purchase.phone_number = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberにはハイフンが含まれていると保存できないこと' do
      @user_purchase.phone_number = '090-1234-5678'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberが12桁以上だと保存できないこと' do
      @user_purchase.phone_number = '090123456789'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number is invalid")
    end

  end
end