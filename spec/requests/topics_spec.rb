require 'rails_helper'

describe TopicsController, type: :request do

  before do
    @topic = FactoryBot.create(:topic)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのtopicのテキストが存在する' do 
    end
    
    it 'indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する' do 
    end
  end
end