require 'rails_helper'

RSpec.describe 'topic投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @topic = Faker::Lorem.sentence
   
  end
  context 'topic投稿ができるとき'do
  it 'ログインしたユーザーは新規投稿できる' do
    # ログインする

    sign_in(@user)

    # 新規投稿ページへのボタンがあることを確認する
    expect(page).to have_content('送')
    # 投稿ページに移動する
    visit new_topic_path
    # フォームに情報を入力する
    select '私(わたし)は 日本語(にほんご)を 勉強(べんきょう)します', from: 'topic[sentence_id]'
    fill_in 'topic[description]', with: @topic
    # 送信するとTweetモデルのカウントが1上がることを確認する
    expect{
      find('button[name="button"]').click
    }.to change { Topic.count }.by(1)
    # トップページに遷移する
    visit root_path
    # トップページには先ほど投稿した内容が存在することを確認する（テキスト）
    #expect(page).to have_content(@user.name) 
  end
end
  context 'topic投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへ移ろうとするとログイン画面へいく事を確認する
      click_on("button")
      expect(current_path).to eq (new_user_session_path)
    end
  end
end