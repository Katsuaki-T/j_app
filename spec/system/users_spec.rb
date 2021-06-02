require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do

    before do
      @user = FactoryBot.build(:user)
    end
  
    context 'ユーザー新規登録ができるとき' do 
      it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
        # トップページに移動する
        visit root_path
        # トップページにサインアップページへ遷移するボタンがあることを確認する
        expect(page).to have_content('新')
        # 新規登録ページへ移動する
        visit new_user_registration_path
        # ユーザー情報を入力する
        fill_in 'user[name]', with: @user.name
        fill_in 'user[birth_country]', with: @user.birth_country
        select '大阪(おおさか)', from: 'user[prefecture_id]'
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        fill_in 'user[password_confirmation]', with: @user.password_confirmation
        # 新規登録を押すとユーザーモデルのカウントが1上がることを確認する
        expect{
          find('button[name="commit"]').click
        }.to change {User.count}.by(1)
        # トップページへ遷移したことを確認する
        expect(current_path).to eq root_path
        # トップページにユーザーの名前が表示されることを確認する
        expect(page).to have_content(@user.name)
       end
     end

     context 'ユーザー新規登録ができないとき' do
      it '誤った情報ではユーザー新規登録ができずにトップページに戻ってくる' do
        # トップページに移動する
        visit root_path
        # トップページにサインアップページに遷移するボタンがあることを確認する
        expect(page).to have_content('新')
        # 新規登録ページへ移動する
        visit new_user_registration_path
        # 誤ったユーザー情報を入力する
        fill_in "user[email]", with: 'test'
        # サインアップボタンを押してもユーザーモデルのカウントが上がらないことを確認する
        expect{
          find('button[name="commit"]').click
        }.to change {User.count}.by(0)
        # 新規登録ページへ戻ってくることを確認する
        expect(current_path).to eq(new_user_registration_path)
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
      # トップページにログインページに遷移するボタンがあることを確認する
      expect(page).to have_content('また')
      # ログインページに遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      # ログインボタンを押す
      find('button[name="button"]').click
      # トップページに遷移する
      visit root_path
      # トップページにユーザーの名前が表示されることを確認する
      expect(page).to have_content(@user.name)
    end
  end
end