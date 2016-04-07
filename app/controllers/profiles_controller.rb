class ProfilesController < ApplicationController
 def index
   @profiles = Profile.all
 end

 def show
   @profile = Profile.find(params[:id])
 end

 def new
   @profile = Profile.new
 end

 def edit
 end

 def create
   @profile = Profile.new(profile_params)
   @profile.user_id = current_user.id

   respond_to do |format|
     if @profile.save
       format.html { redirect_to @profile, notice: "Profile was successfully created." }
       format.json { render :show, status: :created, location: @profile }
     else
       format.html { render :new }
       format.json { render json: @profile.errors, status: :unprocessable_entity }
     end
   end
 end

 private

  def profile_params
    params.require(:profile).permit(:name, :bio, :website, :twitter, :facebook, :soundcloud, :mixcloud, :dj)
  end
end
