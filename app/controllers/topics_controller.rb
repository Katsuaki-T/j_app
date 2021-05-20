class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to topic_path(@topic.id)
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to root_path
  end

  private
  def topic_params
    params.require(:topic).permit(:sentence_id, :description).merge(user_id: current_user.id)
  end

end
