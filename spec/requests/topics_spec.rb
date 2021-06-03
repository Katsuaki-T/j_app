require 'rails_helper'

describe TopicsController, type: :request do

  before do
    @topic = FactoryBot.create(:topic)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get root_path
      expect(response.status).to eq 200
    end
    
    it 'indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する' do 
      get root_path
      expect(response.body).to include('選')
    end
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get topic_path(@topic)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのtopicのdescriptionが存在する' do 
      get topic_path(@topic)
      expect(response.body).to include(@topic.description)
    end
  
  end 
end