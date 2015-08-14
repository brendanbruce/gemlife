class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      redirect_to @venue, notice: "New Venue Added."
    else
      render :new
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])

    if @venue.update(venue_params)
      redirect_to @venue, notice: "Venue information was updated"
    else
      render :edit
    end

  end

  def venue_params
    params.require(:venue).permit(:name, :description, :street_address, :city,
                                  :state, :zip_code, :phone, :twitter_url,
                                  :facebook_url, :website_url)
  end
end
