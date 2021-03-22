require 'rails_helper'

RSpec.describe CharacterInfo, type: :model do
  describe 'キャラクター情報の保存' do
    before do
      @character_info = FactoryBot.build(:character_info)
    end

    it '全て正しく入力されていれば保存できる' do
      expect(@character_info).to be_valid
    end
    it 'character_nameが空だと保存できない' do
      @character_info.character_name = ''
      @character_info.valid?
      expect(@character_info.errors.full_messages).to include('Character nameを入力してください')
    end
    it 'pc_numberが空だと保存できない' do
      @character_info.pc_number = ''
      @character_info.valid?
      expect(@character_info.errors.full_messages).to include('Pc numberを入力してください')
    end
    it 'secretが空だと保存できない' do
      @character_info.secret = ''
      @character_info.valid?
      expect(@character_info.errors.full_messages).to include('Secretを入力してください')
    end
    it 'secret_nが空だと保存できない' do
      @character_info.secret_n = ''
      @character_info.valid?
      expect(@character_info.errors.full_messages).to include('Secret nを入力してください')
    end
    it 'last_resortが空だと保存できない' do
      @character_info.last_resort = ''
      @character_info.valid?
      expect(@character_info.errors.full_messages).to include('Last resortを入力してください')
    end
    it 'last_resort_nが空だと保存できない' do
      @character_info.last_resort_n = ''
      @character_info.valid?
      expect(@character_info.errors.full_messages).to include('Last resort nを入力してください')
    end
  end
end
