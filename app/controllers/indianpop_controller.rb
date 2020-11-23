class IndianpopController < ApplicationController
  def index
    @indianpops = Post.where(category_id: 6)
    @indianpops = @indianpops.order("created_at DESC")
  end
end
