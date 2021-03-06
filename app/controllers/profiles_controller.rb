class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :require_permission, only: [:edit]

  def index
    @profiles = Profile.all
  end

  def show
    profile = Profile.find(params[:id])
    @profile = ProfilePresenter.new(profile)
  end

  def new
    @profile = Profile.new
  end

  def edit
    @profile = Profile.find(params[:id])
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

  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :bio, :website, :twitter, :facebook, :soundcloud, :mixcloud, :dj, :image)
  end

  def require_permission
    if current_user.profile != Profile.find(params[:id])
      redirect_to action: "show"
    end
  end
end
