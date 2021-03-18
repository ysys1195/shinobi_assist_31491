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
      expect(@condition.errors.full_messages).to include('State is not a number')
    end
    it 'state_idが1だと保存されない' do
      @condition.state_id = 1
      @condition.valid?
      expect(@condition.errors.full_messages).to include('State must be other than 1')
    end
    it 'characterに紐づいていないと保存されない' do
      @condition.character = nil
      @condition.valid?
      expect(@condition.errors.full_messages).to include('Character must exist')
    end
  end
end
