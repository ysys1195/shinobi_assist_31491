require 'rails_helper'

RSpec.describe Secret, type: :model do
  describe '秘密情報の保存' do
    before do
      @secret = FactoryBot.build(:secret)
    end

    it '全て正しく入力されていれば保存される' do
      expect(@secret).to be_valid
    end
    it 'secret_nが空だと保存されない' do
      @secret.secret_n = ''
      @secret.valid?
      expect(@secret.errors.full_messages).to include('秘密番号を入力してください')
    end
    it 'secretが空だと保存されない' do
      @secret.secret = ''
      @secret.valid?
      expect(@secret.errors.full_messages).to include('秘密を入力してください')
    end
    it 'characterと紐づいていないと保存されない' do
      @secret.character = nil
      @secret.valid?
      expect(@secret.errors.full_messages).to include('Characterを入力してください')
    end
  end
end
