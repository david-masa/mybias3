class GoodrankingController < ApplicationController
  def index
    @posts = Post.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
  end
end
