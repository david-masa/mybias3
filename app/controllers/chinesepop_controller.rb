class ChinesepopController < ApplicationController
  def index
    @chinesepops = Post.where(category_id: 4)
    @chinesepops = @chinesepops.order("created_at DESC")
  end
end
