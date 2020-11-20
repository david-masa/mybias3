class KpopController < ApplicationController
  def index
    @kpops = Post.where(category_id: 1)
    @kpops = @kpops.order("created_at DESC")
  end
end
