class PostsController < ApplicationController
  def index
    @posts = Post.all
    render
  end

  def show
    @post = Post.find(params[:id])
    render
  end
end