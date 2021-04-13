require 'rails_helper'

RSpec.describe "SessionLogs", type: :system do
  before do
    @gm_room = FactoryBot.create(:room)
    Role.create(role: 200, user_id: @gm_room.user.id, room_id: @gm_room.id)
    @pl_room = FactoryBot.create(:room)
    Role.create(role: 2, user_id: @pl_room.user.id, room_id: @pl_room.id)
    @character = Character.create(character_name: 'name', pc_number: 1, room_id: @gm_room.id)
    @session_log = FactoryBot.build(:session_log)
  end

  context 'セッション履歴を保存できた時' do
    it 'ログインしたユーザーでありroleが200だとセッション履歴を作成できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @gm_room.user.email
      fill_in 'パスワード', with: @gm_room.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 作成したセッションルームに入室する
      visit room_path(@gm_room.token)
      # 履歴作成ボタンがあることを確認する
      expect(page).to have_link(href: "/rooms/session_logs/#{@gm_room.token}/new")
      # 履歴作成ボタンをクリックする
      find_link(href: "/rooms/session_logs/#{@gm_room.token}/new").click
      # セッション履歴作成ページに遷移したことを確認する
      expect(current_path).to eq "/rooms/session_logs/#{@gm_room.token}/new"
      # ページ内にセッションルームの部屋名があることを確認する
      expect(page).to have_field '表題', with: @gm_room.room_name
    end
    it 'ログインしたユーザーでもroleが200以外だとセッション履歴を作成できない' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @pl_room.user.email
      fill_in 'パスワード', with: @pl_room.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 作成したセッションルームに入室する
      visit room_path(@gm_room.token)
      # 履歴作成ボタンがないことを確認する
      expect(page).to have_no_link(href: "/rooms/session_logs/#{@gm_room.token}/new")
    end
  end
end
