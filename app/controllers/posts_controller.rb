class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @user = User.find(params[:user_id])
    query = {}
    query = ["parent is (?)", "wall/" + params[:user_id]]
    @posts = Post.where(query)
  end

  # GET /posts/1
  def show
    @post = @user.posts
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find params[:id]
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
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:content,:user_id,:parent,:children)
    end
end
