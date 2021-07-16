require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nameとemail、password_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nameがからでは登録できないこと' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'emailがからでは登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordがからでは登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
  end

end
