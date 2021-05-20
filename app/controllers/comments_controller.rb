class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
     @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    end
  end

end
