class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    url = params[:post][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url
    if @post.save
      flash[:success] = '投稿しました'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :reason, :youtube_url, :category_id)
  end
end
