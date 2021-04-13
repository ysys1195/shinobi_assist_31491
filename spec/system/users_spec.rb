require 'rails_helper'

RSpec.describe 'サインイン', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができる時' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      #トップページに移動する
      visit root_path
      #トップページに新規登録ページへ遷移するボタンがあることを確認する
      expect(page).to have_link(href: '/users/sign_up')
      #新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'ユーザー名', with: @user.name
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード確認', with: @user.password_confirmation
      #登録ボタンを押すとユーザーモデルのカウントが１上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      #トップページへ遷移したことを確認する
      expect(current_path).to eq root_path
      #トップページにログアウトボタンがあることを確認する
      expect(page).to have_link(href: '/users/sign_out')
      #ゲストログインボタン、ログインボタン、新規登録ボタンが表示されていないことを確認する
      expect(page).to have_no_link(href: '/users/guest_sign_in')
      expect(page).to have_no_link(href: '/users/sign_in')
      expect(page).to have_no_link(href: '/users/sign_up')
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      #トップページに新規登録ページへ遷移するボタンがあることを確認する
      expect(page).to have_link(href: "/users/sign_in")
      #新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'ユーザー名', with: ''
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      fill_in 'パスワード確認', with: ''
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_link(href: '/users/sign_in')
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq root_path
      #トップページにログアウトボタンがあることを確認する
      expect(page).to have_link(href: '/users/sign_out')
      #ゲストログインボタン、ログインボタン、新規登録ボタンが表示されていないことを確認する
      expect(page).to have_no_link(href: '/users/guest_sign_in')
      expect(page).to have_no_link(href: '/users/sign_in')
      expect(page).to have_no_link(href: '/users/sign_up')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_link(href: '/users/sign_in')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq user_session_path
    end
  end
end