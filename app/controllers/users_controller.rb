class UsersController < ApplicationController
  include SessionsHelper

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    params[:user_id] = params[:id]
    if(session[:user_id].nil? == false)
      id = params[:id] # retrieve user ID from URI route
      @current_user = User.find(session[:user_id.to_s])
      @user = User.find(id)
    end
    @posts = Post.where(:parent => "newsfeed/#{@user.id}")
  end
  # GET /users/new
  
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find params[:id]
    if (!@auth_admin)
      flash[:error] = 'Unauthorized Access Request'
      redirect_to root_path
    end
  end

  # POST /users
  def create
    # @user = User.create(user_params)
    begin
      @user = User.new(user_params)
      if @user.save!
        sign_in @user
        flash[:notice] = "Welcome"
          session[:user_id] = @user.id
        redirect_to @user
      end
      rescue ActiveRecord::RecordInvalid => e
        strBuff = e.record.errors.messages.inspect
        strBuff = strBuff .gsub(":name_first", '"First Name"')
        strBuff = strBuff .gsub(":name_last", '"Last Name"')
        strBuff = strBuff .gsub(":password_confirmation", '"Confirm Password"')
        flash[:error] = strBuff
        render 'new'
    end

  end

  # PATCH/PUT /users/1
  def update
    if(@auth_admin)
      if @user.update(user_params)
        @user.update_attributes!(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render action: 'edit'
      end
    else
      flash[:error] = 'Unauthorized Access Request'
      redirect_to root_path
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
      
      if(params[:id] == session[:user_id].to_s) 
        @auth_admin = true
      else
        @auth_admin = false
      end
      
      if(!current_user.nil? && current_user.confirmed_friends.find_by_id(params[:id]))
        @auth_friend = true
      else 
        @auth_friend = false
      end
      
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      # params[:user]
      params.require(:user).permit(:name_first,:name_last, :email, :dob, :gender, :interests, :music, :quotes, :tv_and_movies, :password, :password_confirmation)
    end

    
end
