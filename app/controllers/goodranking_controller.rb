class GoodrankingController < ApplicationController
  def index
    @goodrankings = Post.includes(:liked_users).limit(5).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    
  end
end
