require 'rails_helper'

RSpec.describe Feeling, type: :model do
  describe '感情情報の保存' do
    before do
      @feeling = FactoryBot.build(:feeling)
    end

    it '全て正しく入力されれば保存できる' do
      expect(@feeling).to be_valid
    end
    it 'feel_idが空だと保存されない' do
      @feeling.feel_id = ''
      @feeling.valid?
      expect(@feeling.errors.full_messages).to include("Feel can't be blank")
    end
    it 'feel_idが1だと保存されない' do
      @feeling.feel_id = 1
      @feeling.valid?
      expect(@feeling.errors.full_messages).to include('Feel must be other than 1')
    end
    it 'feeling_toが空だと保存されない' do
      @feeling.feeling_to = ''
      @feeling.valid?
      expect(@feeling.errors.full_messages).to include("Feeling to can't be blank")
    end
    it 'characterと紐づいていないと保存できない' do
      @feeling.character = nil
      @feeling.valid?
      expect(@feeling.errors.full_messages).to include('Character must exist')
    end
  end
end
