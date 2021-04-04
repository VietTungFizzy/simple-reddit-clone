class PublicController < ApplicationController
  def index
    @communities = Community.all.limit(5)
    @posts = Post.all.limit(20).order('id DESC')
  end

  def profile
    @profile = Account.find_by username: params[:username]
    @posts = Post.where(account_id: @profile.id)
    # @posts = @profile.posts
  end
end
