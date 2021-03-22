require 'rails_helper'

RSpec.describe OpenLastResort, type: :model do
  describe '奥義公開か非公開の保存' do
    before do
      @open_last_resort = FactoryBot.build(:open_last_resort)
    end

    it '全て正しく入力されていると保存できる' do
      expect(@open_last_resort).to be_valid
    end
    it 'lr_unveil_toが空だと保存されない' do
      @open_last_resort.lr_unveil_to = ''
      @open_last_resort.valid?
      expect(@open_last_resort.errors.full_messages).to include('奥義公開相手を入力してください')
    end
    it 'unveiled_idが空だと保存されない' do
      @open_last_resort.unveiled_id = ''
      @open_last_resort.valid?
      expect(@open_last_resort.errors.full_messages).to include('公開非公開を入力してください', '公開非公開は一覧にありません')
    end
    it 'unveiled_idが1か2以外だと保存されない' do
      @open_last_resort.unveiled_id = 3
      @open_last_resort.valid?
      expect(@open_last_resort.errors.full_messages).to include('公開非公開は一覧にありません')
    end
    it 'last_resortが紐づいていないと保存できない' do
      @open_last_resort.last_resort = nil
      @open_last_resort.valid?
      expect(@open_last_resort.errors.full_messages).to include('Last resortを入力してください')
    end
  end
end
