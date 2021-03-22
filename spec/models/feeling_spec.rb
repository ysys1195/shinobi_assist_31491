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
      expect(@feeling.errors.full_messages).to include('感情を入力してください', '感情は数値で入力してください')
    end
    it 'feel_idが1だと保存されない' do
      @feeling.feel_id = 1
      @feeling.valid?
      expect(@feeling.errors.full_messages).to include('感情は1以外の値にしてください')
    end
    it 'feeling_toが空だと保存されない' do
      @feeling.feeling_to = ''
      @feeling.valid?
      expect(@feeling.errors.full_messages).to include('感情を結ぶ相手を入力してください')
    end
    it 'characterと紐づいていないと保存できない' do
      @feeling.character = nil
      @feeling.valid?
      expect(@feeling.errors.full_messages).to include('Characterを入力してください')
    end
  end
end
