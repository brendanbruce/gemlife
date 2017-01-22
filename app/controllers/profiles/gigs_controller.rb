class Profiles::GigsController < ApplicationController
  def index
    profile = Profile.find(params[:profile_id])
    @profile = ProfilePresenter.new(profile)
    @gigs = @profile.gigs
  end
end
