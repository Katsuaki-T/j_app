class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_topic, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  before_action :search_topic, only: [:index, :search]

  def index
    @topics = Topic.includes(:user).order('created_at DESC')
  end
  
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
    
  end

  def update
    
    if @topic.update(topic_params)
      redirect_to topic_path(@topic.id)
    else
      render :edit
    end
  end

  def destroy

    @topic.destroy
  end

  def search
    @results = @p.result.includes(:sentence_id)  # 検索条件にマッチした商品の情報を取得
  end

  private
  def topic_params
    params.require(:topic).permit(:sentence_id, :description).merge(user_id: current_user.id)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @topic.user_id
  end

  def search_topic
    @p = Topic.ransack(params[:q])  # 検索オブジェクトを生成
  end

end
