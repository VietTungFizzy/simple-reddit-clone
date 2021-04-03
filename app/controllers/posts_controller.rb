class PostsController < ApplicationController
  def index
  end

  def new
    @community = Community.find(params[:community_id])
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new post_params
    @post.community_id = params[:community_id]
    @post.account_id = current_account.id
    if @post.save
      redirect_to community_path(params[:community_id])
    else
      flash[:notice] = "You must fill all fields"
      @community = Community.find(params[:community_id])
      render :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
