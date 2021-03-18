require 'rails_helper'

RSpec.describe Role, type: :model do
  describe '役割保存' do
    before do
      @role = FactoryBot.build(:role)
    end

    it '全て正しく入力されていれば保存される' do
      expect(@role).to be_valid
    end
    it 'userと紐づいていないと保存されない' do
      @role.user = nil
      @role.valid?
      expect(@role.errors.full_messages).to include('User must exist')
    end
    it 'roomと紐づいていないと保存されない' do
      @role.room = nil
      @role.valid?
      expect(@role.errors.full_messages).to include('Room must exist')
    end
  end
end
