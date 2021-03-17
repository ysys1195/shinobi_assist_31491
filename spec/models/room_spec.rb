require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'ルーム作成' do
    before do
      @room = FactoryBot.build(:room)
    end
    context 'ルーム作成成功' do
      it 'room_name/player_numberが存在すれば部屋が作成される' do
        expect(@room).to be_valid
      end
    end
    context 'ルーム作成失敗' do
      it 'room_nameが存在しなければ部屋が作成されない' do
        @room.room_name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Room name can't be blank")
      end
      it 'player_numberが存在しなければ部屋が作成されない' do
        @room.player_number = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Player number can't be blank")
      end
      it 'player_numberが2未満だと部屋が作成されない' do
        @room.player_number = 1
        @room.valid?
        expect(@room.errors.full_messages).to include('Player number must be greater than or equal to 2')
      end
      it 'player_numberが9以上だと部屋が作成されない' do
        @room.player_number = 9
        @room.valid?
        expect(@room.errors.full_messages).to include('Player number must be less than or equal to 8')
      end
      it 'passwordが存在しなければ部屋が作成されない' do
        @room.password = nil
        @room.password_confirmation = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが4文字未満だと部屋が作成されない' do
        @room.password = 'a1b'
        @room.password_confirmation = 'a1b'
        @room.valid?
        expect(@room.errors.full_messages).to include('Password is too short (minimum is 4 characters)')
      end
      it 'password_confirmationとpasswordが一致しないと部屋が作成されない' do
        @room.password = 'aaaa'
        @room.password_confirmation = '1111'
        @room.valid?
        expect(@room.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'userが紐づいてないと部屋が作成されない' do
        @room.user = nil
        @room.valid?
        expect(@room.errors.full_messages).to include('User must exist')
      end
    end
  end
end
