require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'キャラクター名の保存' do
    before do
      @character = FactoryBot.build(:character)
    end

    it '全て正しく入力されていれば保存できる' do
      expect(@character).to be_valid
    end
    it 'character_nameが空だと保存できない' do
      @character.character_name = ''
      @character.valid?
      expect(@character.errors.full_messages).to include("Character name can't be blank")
    end
    it 'pc_numberが空だと保存できない' do
      @character.pc_number = ''
      @character.valid?
      expect(@character.errors.full_messages).to include("Pc number can't be blank")
    end
    it 'roomと紐づいていないと保存できない' do
      @character.room = nil
      @character.valid?
      expect(@character.errors.full_messages).to include('Room must exist')
    end
  end
end
