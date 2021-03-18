require 'rails_helper'

RSpec.describe EnterRoom, type: :model do
  describe 'セッションルームへの入室' do
    before do
      @enter_room = FactoryBot.build(:enter_room)
    end

    it '全て正しく入力されていれば入室できる' do
      expect(@enter_room).to be_valid
    end
    it 'roleが空だと入室できない' do
      @enter_room.role = ''
      @enter_room.valid?
      expect(@enter_room.errors.full_messages).to include("Role can't be blank")
    end
    it 'roleが1~8以外だと入室できない' do
      @enter_room.role = 9
      @enter_room.valid?
      expect(@enter_room.errors.full_messages).to include('Role must be less than or equal to 8')
    end
    it 'tokenが空だと入室できない' do
      @enter_room.token = ''
      @enter_room.valid?
      expect(@enter_room.errors.full_messages).to include("Token can't be blank")
    end
    it 'passwordが空だと入室できない' do
      @enter_room.password = ''
      @enter_room.valid?
      expect(@enter_room.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが3文字以下だと入室できない' do
      @enter_room.password = 'aaa'
      @enter_room.valid?
      expect(@enter_room.errors.full_messages).to include('Password is too short (minimum is 4 characters)')
    end
  end
end
