require 'rails_helper'

RSpec.describe '秘密追加', type: :system do
  before do
    @gm_room = FactoryBot.create(:room)
    Role.create(role: 200, user_id: @gm_room.user.id, room_id: @gm_room.id)
    @pl_room = FactoryBot.create(:room)
    Role.create(role: 2, user_id: @pl_room.user.id, room_id: @pl_room.id)
    @character = Character.create(character_name: 'test', pc_number: 1, room_id: @gm_room.id)
    Secret.create(secret_n: 1, secret: 'secret', character_id: @character.id)
    LastResort.create(last_resort_n: 1, last_resort: 'last resort', character_id: @character.id)
  end

  context '秘密を追加することができる' do
    it 'ログインしてセッションルームを作成したユーザーは秘密を追加できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @gm_room.user.email
      fill_in 'パスワード', with: @gm_room.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 作成したセッションルームに入室する
      visit room_path(@gm_room.token)
      # 秘密カードにマウスオーバーすると吹き出しが現れる
      find('div[data-target="secret-info1"]').hover
      # 秘密追加ボタンをクリックする
      find('button[data-target="add-secret1"]').click
      # 秘密情報追加のモーダルウィンドウを表示する
      expect(page).to have_selector('#add-secret1')
      # フォームに情報を入力する
      fill_in '秘密', with: '2nd secret'
      # 追加ボタンをクリックするとSecretモデルのカウントが1上がる
      expect{
        find('input[name="commit"]').click
        sleep 1
      }.to change { Secret.count }.by(1)
    end
  end
  context '秘密を追加することができない' do
    it 'ログインしてセッションルームを作成したユーザー以外は秘密を追加できない' do
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
      # 秘密カードにマウスオーバーすると吹き出しが現れる
      find('div[data-target="secret-info1"]').hover
      # 秘密追加ボタンがないことを確認する
      sleep 1
      expect(page).to have_no_button '追加'
    end
  end
end

RSpec.describe '秘密編集', type: :system do
  before do
    @gm_room = FactoryBot.create(:room)
    Role.create(role: 200, user_id: @gm_room.user.id, room_id: @gm_room.id)
    @pl_room = FactoryBot.create(:room)
    Role.create(role: 2, user_id: @pl_room.user.id, room_id: @pl_room.id)
    @character = Character.create(character_name: 'test', pc_number: 1, room_id: @gm_room.id)
    Secret.create(secret_n: 1, secret: 'secret1', character_id: @character.id)
    # Secret.create(secret_n: 2, secret: 'secret2', character_id: @character.id)
    LastResort.create(last_resort_n: 1, last_resort: 'last resort', character_id: @character.id)
  end

  context '秘密を編集することができる' do
    it 'ログインしてセッションルームを作成したユーザーは秘密を編集できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @gm_room.user.email
      fill_in 'パスワード', with: @gm_room.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 作成したセッションルームに入室する
      visit room_path(@gm_room.token)
      # 秘密カードにマウスオーバーすると吹き出しが現れる
      find('div[data-target="secret-info1"]').hover
      # 秘密の編集ボタンをクリックする
      find('button[data-target="edit-secret1-1"]').click
      # 秘密情報追加のモーダルウィンドウを表示する
      expect(page).to have_selector('#edit-secret1-1')
      # フォームに情報を入力する
      fill_in '秘密', with: 'change secret'
      # 編集ボタンをクリックする
      find('input[name="commit"]').click
      # 秘密カードにマウスオーバーすると吹き出しが現れ、秘密1をクリックするとモーダルウィンドウが現れる
      find('div[data-target="secret-info1"]').hover
      sleep 1
      find('button[data-target="unveil-secret1-1"]').click
      sleep 1
      # 編集された秘密が画面に表示されていることを確認する
      expect(page).to have_content('change secret')
    end
  end
  context '秘密を編集することができない' do
    it 'ログインしてセッションルームを作成したユーザー以外は秘密を編集できない' do
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
      # 秘密カードにマウスオーバーすると吹き出しが現れる
      find('div[data-target="secret-info1"]').hover
      # 秘密追加ボタンがないことを確認する
      sleep 1
      expect(page).to have_no_button '追加'
    end
  end
end
