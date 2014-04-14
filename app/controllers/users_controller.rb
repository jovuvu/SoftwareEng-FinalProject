class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id)
  end

  # GET /users/new
  def new
    # @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find params[:id]
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.save
    redirect_to user_path(@user)
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
      params.require(:user).permit(:name_first,:name_last, :email, :dob, :gender, :interests, :music, :quotes, :tv_and_movies, :password)
    end
end
