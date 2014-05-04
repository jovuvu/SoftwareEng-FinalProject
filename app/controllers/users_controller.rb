class UsersController < ApplicationController
  include SessionsHelper

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id)
    @posts = Post.where(:parent => "newsfeed/#{@user.id}")
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if (session[:user_id].to_s == params[:id])
      @user = User.find params[:id]
    else
      @user = User.find params[:id]
      flash[:notice] = "You cannot edit another users profile."
      redirect_to @user
    end
  end

  # POST /users
  def create
    # @user = User.create(user_params)
    
    @user = User.create!(user_params)
    if @user.save
      sign_in @user
      flash[:notice] = "Welcome"
        session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end

  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      @user.update_attributes!(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      # params[:user]
      params.require(:user).permit(:name_first,:name_last, :email, :dob, :gender, :interests, :music, :quotes, :tv_and_movies, :password, :password_confirmation)
    end

    
end
