class JpopController < ApplicationController
  def index
    @jpops = Post.where(category_id: 2)
    @jpops = @jpops.order("created_at DESC")
  end
end
