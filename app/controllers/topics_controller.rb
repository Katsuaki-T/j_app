class TopicsController < ApplicationController

  def index
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

  private
  def topic_params
    params.require(:topic).permit(:sentence_id, :description).merge(user_id: current_user.id)
  end

end
