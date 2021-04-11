class PostsController < ApplicationController
  before_action :authenticate_account!, except: [:index, :show]
  before_action :auth_subscriber, only: [:new]

  def index
  end

  def new
    @community = Community.find(params[:community_id])
    @post = Post.new
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @comment = Comment.new
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

    def auth_subscriber
      unless Subscription.where(community_id: params[:community_id], account_id: current_account.id).any?
        redirect_to root_path, flash: {danger: "You are not authorized to view this page"}
      end
    end
end
