require 'rails_helper'

RSpec.describe LastResort, type: :model do
  describe '奥義情報の保存' do
    before do
      @last_resort = FactoryBot.build(:last_resort)
    end

    it '全て正しく入力したら保存できる' do
      expect(@last_resort).to be_valid
    end
    it 'last_resort_nが空だと保存できない' do
      @last_resort.last_resort_n = ''
      @last_resort.valid?
      expect(@last_resort.errors.full_messages).to include('奥義番号を入力してください')
    end
    it 'last_resortが空だと保存できない' do
      @last_resort.last_resort = ''
      @last_resort.valid?
      expect(@last_resort.errors.full_messages).to include('奥義を入力してください')
    end
    it 'characterと紐づいていないと保存できない' do
      @last_resort.character = nil
      @last_resort.valid?
      expect(@last_resort.errors.full_messages).to include('Characterを入力してください')
    end
  end
end
