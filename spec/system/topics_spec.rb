require 'rails_helper'

RSpec.describe 'topic投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @ttopic = Faker::Lorem.sentence
  end
  context 'topic投稿ができるとき'do
  it 'ログインしたユーザーは新規投稿できる' do
    # ログインする

    sign_in(@user)

    # 新規投稿ページへのボタンがあることを確認する
    # 投稿ページに移動する
    # フォームに情報を入力する
    # 送信するとTweetモデルのカウントが1上がることを確認する
    # 投稿完了ページに遷移することを確認する
    # 「投稿が完了しました」の文字があることを確認する
    # トップページに遷移する
    # トップページには先ほど投稿した内容のツイートが存在することを確認する（画像）
    # トップページには先ほど投稿した内容のツイートが存在することを確認する（テキスト）
  end
end
  context 'topic投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      # 新規投稿ページへのボタンがないことを確認する
    end
  end
end