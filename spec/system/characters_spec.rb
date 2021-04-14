require 'rails_helper'

RSpec.describe 'キャラクター情報', type: :system do
  before do
    @gm_room = FactoryBot.create(:room)
    Role.create(role: 200, user_id: @gm_room.user.id, room_id: @gm_room.id)
    @pl_room = FactoryBot.create(:room)
    # @pl_role = Role.create(role: 2, user_id: @pl_room.user.id, room_id: @pl_room.id)
    @character = Character.new(character_name: 'name', pc_number: 1, room_id: @gm_room.id)
    @secret = Secret.new(secret_n: 1, secret: 'secret', character_id: @character.id)
    @last_resort = LastResort.new(last_resort_n: 1, last_resort: 'last resort', character_id: @character.id)
  end

  context 'キャラクター情報の保存成功' do
    it 'セッションルームを作成したユーザーはキャラクター情報を保存できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @gm_room.user.email
      fill_in 'パスワード', with: @gm_room.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 作成したセッションルームに入室する
      visit room_path(@gm_room.token)
      # キャラクター情報を入力ボタンでモーダルウィンドウを開く
      find('button[data-target="form-bg1"]').click
      # フォームに情報を入力する
      fill_in 'キャラクター名', with: @character.character_name
      fill_in '秘密', with: @secret.secret
      fill_in '奥義', with: @last_resort.last_resort
      # 送信するとCharacterモデルのカウントが1上がることを確認する
      expect{
        find('input[value="追加"]').click
        sleep 1
      }.to change { Character.count }.by(1)
      # セッションルームページに遷移することを確認するためフォームに入力した部屋名があることを確認する
      expect(page).to have_content(@character.character_name)
    end
    it 'セッションルームを作成したユーザー以外はキャラクター情報を保存できない' do
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
      # キャラクター情報を入力ボタンがないことを確認する
      expect(page).to have_no_button 'キャラクター情報を入力'
    end
  end
end

RSpec.describe 'キャラクター名変更', type: :system do
  before do
    @gm_room = FactoryBot.create(:room)
    Role.create(role: 200, user_id: @gm_room.user.id, room_id: @gm_room.id)
    @pl_room = FactoryBot.create(:room)
    Role.create(role: 2, user_id: @pl_room.user.id, room_id: @pl_room.id)
    @character = Character.create(character_name: 'test', pc_number: 1, room_id: @gm_room.id)
    @secret = Secret.create(secret_n: 1, secret: 'secret', character_id: @character.id)
    @last_resort = LastResort.create(last_resort_n: 1, last_resort: 'last resort', character_id: @character.id)
  end

  context 'キャラクター名の変更に成功' do
    it 'セッションルームを作成したユーザーはキャラクター情報を保存できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @gm_room.user.email
      fill_in 'パスワード', with: @gm_room.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 作成したセッションルームに入室する
      visit room_path(@gm_room.token)
      # キャラクター名をクリックしてモーダルウィンドウを開く
      find('button[data-target="edit-char-name1"]').click
      # フォームにキャラクター名があることを確認する
      expect(page).to have_field 'キャラクター名', with: @character.character_name
      # フォームのキャラクター名を変更する
      fill_in 'キャラクター名', with: 'change'
      # 変更ボタンをクリックする
      click_button '変更'
      # 変更したキャラクター名がセッションルームにあることを確認する
      expect(page).to have_content('change')
    end
    it 'セッションルームを作成したユーザー以外はキャラクター情報を保存できない' do
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
      # キャラクター名をクリックしてもモーダルウィンドウを開けないことを確認する
      find('button[data-target="edit-char-name1"]').click
      expect(page).to have_no_selector('#change-name1')
    end
  end
end