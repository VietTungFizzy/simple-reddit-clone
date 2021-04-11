class CommunitiesController < ApplicationController
  before_action :authenticate_account!, except: [:index, :show]

  def index
    @community = Community.all
  end

  def show
    @community = Community.find(params[:id])
    @posts = Post.where(community_id: params[:id])
    @subscriber_count = @community.subscribers.count
    @is_subscribed = account_signed_in? ? Subscription.where(community_id: @community.id, account_id: current_account.id).any? : false
    @subscription = Subscription.new
  end

  def create
    @community = Community.new community_params
    @community.account_id = current_account.id
    if @community.save
      redirect_to communities_path
    else
      flash.notice = "You must fill name and url!!!"
      render :new
    end
  end

  def new
    @community = Community.new
  end

  private
    def community_params
      params.require(:community).permit(:name, :url, :rules)
    end
end
