require 'rails_helper'

RSpec.describe "Comments", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @topic = FactoryBot.create(:topic)
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーはツイート詳細ページでコメント投稿できる' do
    # ログインする
    sign_in(@user)
    # topic詳細ページに遷移する
    # フォームに情報を入力する
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
  end
end
