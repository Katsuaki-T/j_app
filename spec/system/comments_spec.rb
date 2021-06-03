require 'rails_helper'

def basic_pass(path)
  username = ENV["BASIC_AUTH_USER_2"]
  password = ENV["BASIC_AUTH_PASSWORD_2"]
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

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
    visit topic_path(@topic)
    # フォームに情報を入力する
    fill_in 'comment[text]', with: @comment
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    expect{
      find('button[name="commit"]').click
    }.to change { Comment.count }.by(1)
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content @comment
  end
end
