class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :edit]

  def index
    @likes = Like.all
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
    @like = Like.find(params[:id])
    @like.destroy

    respond_to do |f|
      f.html { redirect_to likes_path }
      f.json { head :no_content }
      f.js { render :layout => false }
    end
  end
end
