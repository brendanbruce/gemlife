class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    if params[:find_by]
      @events = Event.where(start_date: params[:find_by])
    else
      @events = Event.all
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    profile_info = event_params

    respond_to do |format|
      if @event.save
        profile_ids = profile_info[:profile_id]
        profile_ids.each do |i|
          Gig.create(event_id: @event.id, profile_id: i)
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
    respond_to do |format|
      if @event.update(event_params)
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
      params.require(:event).permit(:start_date, :start_time, :end_date, :end_time, :description, :event_link, :title, :flyer, :venue_id, :tag_list, :profile_id => [])
    end
end
