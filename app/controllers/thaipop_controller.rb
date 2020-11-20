class ThaipopController < ApplicationController
  def index
    @thaipops = Post.where(category_id: 3)
    @thaipops = @thaipops.order("created_at DESC")
  end
end
