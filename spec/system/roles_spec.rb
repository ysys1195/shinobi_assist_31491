require 'rails_helper'

RSpec.describe "Roles", type: :system do
  before do
    @room = FactoryBot.create(:room)
    Role.create(role: 2, user_id: @room.user.id, room_id: @room.id)
  end

  context 'セッションルームへ入室できる時' do
    it 'ログインしたユーザーは作成されたルームへ入室できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @room.user.email
      fill_in 'パスワード', with: @room.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # セッションルームへ入室するフォームがあることを確認する
      expect(page).to have_selector('#enter-session-room')
      # フォームに情報を入力する
      fill_in 'PC番号', with: 2
      fill_in '招待コード', with: @room.token
      fill_in '入室パスワード', with: @room.password
      # 部屋入室ボタンをクリックする
      find('input[value="部屋入室"]').click
      # セッションルームページに遷移することを確認する
      expect(current_path).to eq room_path(@room.token)
    end
    it 'ログインしていないと部屋入室のフォームが作成されない' do
      # トップページに遷移する
      visit root_path
      # セッションルーム作成フォームがない
      expect(page).to have_no_selector('#enter-session-room')
    end
  end
end
