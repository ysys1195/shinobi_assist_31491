require 'rails_helper'

RSpec.describe '奥義追加', type: :system do
  before do
    @gm_room = FactoryBot.create(:room)
    Role.create(role: 200, user_id: @gm_room.user.id, room_id: @gm_room.id)
    @pl_room = FactoryBot.create(:room)
    Role.create(role: 2, user_id: @pl_room.user.id, room_id: @pl_room.id)
    @character = Character.create(character_name: 'test', pc_number: 1, room_id: @gm_room.id)
    Secret.create(secret_n: 1, secret: 'secret', character_id: @character.id)
    LastResort.create(last_resort_n: 1, last_resort: 'last resort', character_id: @character.id)
  end

  context '奥義を追加することができる' do
    it 'ログインしてセッションルームを作成したユーザーは奥義を追加できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @gm_room.user.email
      fill_in 'パスワード', with: @gm_room.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 作成したセッションルームに入室する
      visit room_path(@gm_room.token)
      # 奥義カードにマウスオーバーすると吹き出しが現れる
      find('div[data-target="last-resort-info1"]').hover
      # 奥義追加ボタンをクリックする
      find('button[data-target="add-last-resort1"]').click
      # 奥義情報追加のモーダルウィンドウを表示する
      expect(page).to have_selector('#add-last-resort1')
      # フォームに情報を入力する
      fill_in '奥義', with: '2nd last resort'
      # 追加ボタンをクリックするとLastResortモデルのカウントが1上がる
      expect{
        find('input[name="commit"]').click
        sleep 1
      }.to change { LastResort.count }.by(1)
    end
  end
  context '奥義を追加することができない' do
    it 'ログインしてセッションルームを作成したユーザー以外は奥義を追加できない' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @pl_room.user.email
      fill_in 'パスワード', with: @pl_room.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 作成したセッションルームに入室する
      fill_in 'PC番号', with: 1
      fill_in '招待コード', with: @gm_room.token
      fill_in '入室パスワード', with: @gm_room.password
      click_button '部屋入室'
      # 奥義カードにマウスオーバーすると吹き出しが現れる
      find('div[data-target="last-resort-info1"]').hover
      # 奥義追加ボタンがないことを確認する
      sleep 1
      expect(page).to have_no_button '奥義追加'
    end
  end
end

RSpec.describe '奥義編集', type: :system do
  before do
    @gm_room = FactoryBot.create(:room)
    Role.create(role: 200, user_id: @gm_room.user.id, room_id: @gm_room.id)
    @pl_room = FactoryBot.create(:room)
    Role.create(role: 2, user_id: @pl_room.user.id, room_id: @pl_room.id)
    @character = Character.create(character_name: 'test', pc_number: 1, room_id: @gm_room.id)
    Secret.create(secret_n: 1, secret: 'secret1', character_id: @character.id)
    LastResort.create(last_resort_n: 1, last_resort: 'last resort', character_id: @character.id)
  end

  context '奥義を編集することができる' do
    it 'ログインしてセッションルームを作成したユーザーは奥義を編集できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @gm_room.user.email
      fill_in 'パスワード', with: @gm_room.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 作成したセッションルームに入室する
      visit room_path(@gm_room.token)
      # 奥義カードにマウスオーバーすると吹き出しが現れる
      find('div[data-target="last-resort-info1"]').hover
      # 奥義の編集ボタンをクリックする
      find('button[data-target="edit-last-resort1-1"]').click
      # 奥義情報追加のモーダルウィンドウを表示する
      expect(page).to have_selector('#edit-last-resort1-1')
      # フォームに情報を入力する
      fill_in '奥義', with: 'change last resort'
      # 編集ボタンをクリックする
      find('input[name="commit"]').click
      # 奥義カードにマウスオーバーすると吹き出しが現れ、奥義1をクリックするとモーダルウィンドウが現れる
      find('div[data-target="last-resort-info1"]').hover
      sleep 1
      find('button[data-target="unveil-lr1-1"]').click
      sleep 1
      # 編集された奥義が画面に表示されていることを確認する
      expect(page).to have_content('change last resort')
    end
  end
  context '奥義を編集することができない' do
    it 'ログインしてセッションルームを作成したユーザー以外は奥義を編集できない' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @pl_room.user.email
      fill_in 'パスワード', with: @pl_room.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 作成したセッションルームに入室する
      fill_in 'PC番号', with: 1
      fill_in '招待コード', with: @gm_room.token
      fill_in '入室パスワード', with: @gm_room.password
      click_button '部屋入室'
      # 奥義カードにマウスオーバーすると吹き出しが現れる
      find('div[data-target="last-resort-info1"]').hover
      # 奥義追加ボタンがないことを確認する
      sleep 1
      expect(page).to have_no_button '奥義追加'
    end
  end
end
