class PostsController < ApplicationController
  before_action :set_post, only: [:index, :edit, :update, :destroy]

  # GET /posts
  def index
    if(@auth_admin)
      @user = current_user
      @posts = current_user.posts + current_user.friend_posts
    else
      insuff_permissions
    end
  end
  
  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  def create
    if !current_user.nil?
      params[:post][:user_id] = current_user.id
      params[:post][:parent] = "wall/#{params[:user_id]}"
      @post = Post.new(post_params)
      if @post.save
        redirect_to "/users/#{params[:user_id]}/posts"
      else
        render action: 'new'
      end
    else
      redirect_to "/users/#{params[:user_id]}/posts", notice: 'You must be logged in to post.'
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      @post.update_attributes!(post_params)
    else
      render action: 'edit'
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      if(params[:action]!="index")
        @post = Post.find(params[:id])
      end
      if(params[:user_id] == session[:user_id].to_s) 
        @auth_admin = true
      else
        @auth_admin = false
      end
      
      if(!current_user.nil? && current_user.confirmed_friends.find_by_id(params[:id]))
        @auth_friend = true
      else 
        @auth_friend = false
      end
    end
    
    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:content,:user_id,:parent,:children)
    end
end
