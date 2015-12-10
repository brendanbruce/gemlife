class LikesController < ApplicationController
  def index
    @user = current_user
  end

  def new
    @like = Like.new
  end

  def create
    event_id = params[:like][:event_id]
    Like.create(event_id: event_id, user: current_user)
    redirect_to events_path
  end

  def destroy
    like_id = params[:id]
    Like.destroy(like_id)
    redirect_to events_path
  end
end
