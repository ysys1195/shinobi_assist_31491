require 'rails_helper'

RSpec.describe 'セッションルーム作成', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @room = FactoryBot.build(:room)
  end

  context 'セッションルームを作成できる時' do
    it 'ログインしたユーザーは新規ルームを作成できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # セッションルームを作成するフォームがあることを確認する
      expect(page).to have_selector('#create-session-room')
      # フォームに情報を入力する
      fill_in '部屋名', with: @room.room_name
      fill_in 'PC人数', with: @room.player_number
      fill_in 'パスワード', with: @room.password
      fill_in 'パスワード確認', with: @room.password_confirmation
      # 送信するとRoomモデルのカウントが1上がることを確認する
      expect{
        find('input[value="部屋作成"]').click
      }.to change { Room.count }.by(1)
      # セッションルームページに遷移することを確認するためフォームに入力した部屋名があることを確認する
      expect(page).to have_content(@room.room_name)
    end
  end
  context 'セッションルームを作成できない時'do
    it 'ログインしていないとセッションルーム作成フォームが表示されない' do
      # トップページに遷移する
      visit root_path
      # セッションルーム作成フォームがない
      expect(page).to have_no_selector('#create-session-room')
    end
  end
end

RSpec.describe 'セッションルーム削除', type: :system do
  before do
    @gm_room = FactoryBot.create(:room)
    Role.create(role: 200, user_id: @gm_room.user.id, room_id: @gm_room.id)
    @pl_room = FactoryBot.create(:room)
    Role.create(role: 2, user_id: @pl_room.user.id, room_id: @pl_room.id)
  end

  context 'セッションルームを削除できる時' do
    it 'ログインしたユーザーでありroleが200だとセッションルームを削除できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @gm_room.user.email
      fill_in 'パスワード', with: @gm_room.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 作成したセッションルームに入室する
      visit room_path(@gm_room.token)
      # セッションルーム削除ボタンがあることを確認する
      expect(page).to have_link(href: "/rooms/#{@gm_room.token}")
      # セッションルームを削除するとレコードの数が1減ることを確認する
      expect{
        find_link(href: "/rooms/#{@gm_room.token}").click
        page.accept_confirm
        sleep 1
      }.to change { Room.count }.by(-1)
      # トップページに遷移する
      expect(current_path).to eq root_path
    end
  end
  context 'セッションルームを削除できない時' do
    it 'ログインしていてもroleが200以外だと削除できない' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @pl_room.user.email
      fill_in 'パスワード', with: @pl_room.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 他の人が作成したセッションルームに入室する
      visit room_path(@gm_room.token)
      # ルームの削除ボタンがないことを確認する
      expect(page).to have_no_link(href: "/rooms/#{@gm_room.token}")
    end
  end
end