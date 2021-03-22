require 'rails_helper'

RSpec.describe Condition, type: :model do
  describe '変調の保存' do
    before do
      @condition = FactoryBot.build(:condition)
    end

    it '全て正しく入力されれば保存される' do
      expect(@condition).to be_valid
    end
    it 'state_idが空だと保存されない' do
      @condition.state_id = ''
      @condition.valid?
      expect(@condition.errors.full_messages).to include('変調は数値で入力してください')
    end
    it 'state_idが1だと保存されない' do
      @condition.state_id = 1
      @condition.valid?
      expect(@condition.errors.full_messages).to include('変調は1以外の値にしてください')
    end
    it 'characterに紐づいていないと保存されない' do
      @condition.character = nil
      @condition.valid?
      expect(@condition.errors.full_messages).to include('Characterを入力してください')
    end
  end
end
