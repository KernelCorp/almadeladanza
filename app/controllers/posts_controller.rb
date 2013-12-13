class PostsController < ApplicationController
  def index
    @posts = Post.order('id DESC')
    render
  end

  def show
    @post = Post.find(params[:id])
    render
  end
end