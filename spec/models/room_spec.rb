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
        expect(@room.errors.full_messages).to include('部屋名を入力してください')
      end
      it 'player_numberが存在しなければ部屋が作成されない' do
        @room.player_number = ''
        @room.valid?
        expect(@room.errors.full_messages).to include('PC人数を入力してください', 'PC人数は数値で入力してください')
      end
      it 'player_numberが2未満だと部屋が作成されない' do
        @room.player_number = 1
        @room.valid?
        expect(@room.errors.full_messages).to include('PC人数は2以上の値にしてください')
      end
      it 'player_numberが9以上だと部屋が作成されない' do
        @room.player_number = 9
        @room.valid?
        expect(@room.errors.full_messages).to include('PC人数は8以下の値にしてください')
      end
      it 'passwordが存在しなければ部屋が作成されない' do
        @room.password = nil
        @room.password_confirmation = nil
        @room.valid?
        expect(@room.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが4文字未満だと部屋が作成されない' do
        @room.password = 'a1b'
        @room.password_confirmation = 'a1b'
        @room.valid?
        expect(@room.errors.full_messages).to include('パスワードは4文字以上で入力してください')
      end
      it 'password_confirmationとpasswordが一致しないと部屋が作成されない' do
        @room.password = 'aaaa'
        @room.password_confirmation = '1111'
        @room.valid?
        expect(@room.errors.full_messages).to include('パスワード確認とパスワードの入力が一致しません')
      end
      it 'userが紐づいてないと部屋が作成されない' do
        @room.user = nil
        @room.valid?
        expect(@room.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
