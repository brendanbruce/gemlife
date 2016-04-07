class ProfilesController < ApplicationController
 def index
   @profiles = Profile.all
 end

 def show
 end

 def new
   @profile = Profile.new
 end

 def edit

 end
end
