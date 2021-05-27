class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @topic = Topic.find(params[:id])
    
  end

  def create
     @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, topic_id: params[:topic_id])
  end

  def topic_params
    params.require(:topic).permit(:sentence_id, :description).merge(user_id: current_user.id)
  end

end
