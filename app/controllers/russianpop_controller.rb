class RussianpopController < ApplicationController
  def index
    @russianpops = Post.where(category_id: 5)
    @russianpops = @russianpops.order("created_at DESC")
  end
end
