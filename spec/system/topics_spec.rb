require 'rails_helper'

RSpec.describe 'topic投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @topic_text = Faker::Lorem.sentence
   
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
    fill_in 'topic[description]', with: @topic_text
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



RSpec.describe 'topic詳細', type: :system do
  before do
    @topic = FactoryBot.create(:topic)
  end
  it 'ログインしたユーザーはtopc詳細ページに遷移して、編集、削除ボタン、コメント投稿欄が表示される' do
    # ログインする
    visit new_user_session_path
    fill_in 'user[email]', with: @topic.user.email
    fill_in 'user[password]', with: @topic.user.password
    click_on("button")
    expect(current_path).to eq root_path
   
    # 詳細ページに遷移する
    visit topic_path(@topic)
    # 詳細ページにdescriptionの内容が含まれている
     expect(page).to have_content("#{@topic.description}")
    # 編集と削除へのボタンが存在する事
    expect(page).to have_content('直')
    expect(page).to have_content('消')
     # コメント用のフォームが存在する
     expect(page).to have_selector 'form'
  end
  it 'ログインしていない状態でtopic詳細ページに遷移できるもののコメント投稿欄などが表示されない' do
    # トップページに移動する
    visit root_path
    # 詳細ページに遷移する
    visit topic_path(@topic)
    # 詳細ページにdescriptionの内容が含まれている
    expect(page).to have_content("#{@topic.description}")
    # フォームが存在しないことを確認する
    expect(page).to have_no_content('直')
    expect(page).to have_no_content('消')
    expect(page).to have_no_selector 'form'
  end
end

RSpec.describe 'topic削除', type: :system do
  before do
    @topic1 = FactoryBot.create(:topic)
    @topic2 = FactoryBot.create(:topic)
  end
  context 'ツイート削除ができるとき' do
    it 'ログインしたユーザーは自らが投稿したツイートの削除ができる' do
      # ツイート1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'user[email]', with: @topic1.user.email
      fill_in 'user[password]', with: @topic1.user.password
      find('button[name="button"]').click
      expect(current_path).to eq(root_path)
      # 詳細ページに遷移する
      visit topic_path(@topic1)
      # ツイート1に「削除」へのボタンがあることを確認する
      expect(page).to have_content('消')
      # 投稿を削除する（confirmダイアログでOKを選択する）
      page.accept_confirm do
        find("#delete-btn").click
      end
      # 削除完了画面に遷移したことを確認する
      expect(current_path).to eq(topic_path(@topic1))
      # 「削除が完了しました」の文字があることを確認する
      expect(page).to have_content('消')
      
    end
  end
  context 'ツイート削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿したツイートの削除ができない' do
      # topic1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'user[email]', with: @topic1.user.email
      fill_in 'user[password]', with: @topic1.user.password
      find('button[name="button"]').click
      expect(current_path).to eq(root_path)
      # topic2の詳細ページに遷移する
      visit topic_path(@topic2)
      # topic2に削除のボタンがないことを確認する
      expect(page).to have_no_content('消')

    end
    it 'ログインしていないとtopicの削除ボタンがない' do
      # トップページに移動する
      visit root_path
      # topicに削除ボタンがないことを確認する
      expect(page).to have_no_content('消')
     
    end
  end
end