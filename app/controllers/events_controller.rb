class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    if params[:find_by]
      @events = Event.where(start_date: params[:find_by])
    else
      @events = Event.where(start_date: Date.today)
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @event }
    end

  end

  def new
    @event = Event.new
    @venues = Venue.all
  end

  def edit
    unless @event.user_id == current_user.id
      redirect_to events_path, flash: { error: "You can't edit this" } and return false
    end
  end

  def create
    @event = Event.new(event_params.merge(user_id: current_user.id))
    profile_info = event_params

    respond_to do |format|
      if @event.save
        if profile_info[:profile_id]
          profile_ids = profile_info[:profile_id]
          profile_ids.each do |i|
            Gig.create(event_id: @event.id, profile_id: i)
          end
        end

        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    profile_info = event_params

    respond_to do |format|
      if @event.update(event_params)
        if profile_info[:profile_id]
          profile_ids = profile_info[:profile_id]
          profile_ids.each do |i|
            Gig.create(event_id: @event.id, profile_id: i)
          end
        end

        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:start_date, :start_time, :end_date, :end_time, :description, :event_link, :title, :flyer, :venue_id, :tag_list, :user_id, :profile_id => [])
    end
end
