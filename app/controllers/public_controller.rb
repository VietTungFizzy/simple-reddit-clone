class PublicController < ApplicationController
  def index
    @communities = Community.all.limit(5)
    @posts = Post.all.limit(20).order('id DESC')
  end
end
