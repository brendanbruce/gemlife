class UsersController < ApplicationController
  before_action :set_type

  def index
    @users = type_class.all
  end

  def show
    @user = type_class.find(params[:id])
  end

  def new
    @user = type_class.new
  end

  def create
    @user = type_class.new(user_params(type_symbolize))
    if @user.save
      redirect_to @user, notice: "User added."
    end
  end

  def edit
    @user = type_class.find(params[:id])
  end

  def update
    @user = type_class.find(params[:id])
    if @user.update_attributes(user_params(type_symbolize))
      flash[:success] = "Update Success"
      redirect_to @user
    else
      flash[:error] = "Update Failure"
      render :edit
    end
  end

  private
  def set_type
    @type = type
  end

  def type
    if User.types.include?(params[:type])
      params[:type]
    else
      "User"
    end
  end

  def type_class
    type.constantize
  end

  def type_symbolize
    type.parameterize.underscore.to_sym
  end

  def user_params(type_symbolize)
    params.require(type_symbolize).permit(:first_name, :last_name, :email, :type,
                                 :website, :soundcloud_url, :twitter_url,
                                 :facebook_url)
  end
end
