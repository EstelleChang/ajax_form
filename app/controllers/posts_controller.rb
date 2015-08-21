class PostsController < ApplicationController
	include PostsHelper
	protect_from_forgery
	before_action :authenticate_user!, except: [:show, :index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :validate_owner, only: [:edit, :update, :destroy]
  respond_to :html, :js
	

  def new
  	@post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      # redirect_to posts_url, notice: "Your post has been created"
    else
      render :new
    end
  end

  def update
    @post.attributes = post_params

    if @post.save
    redirect_to post_url, notice: "Your post has been updated"
    else
      render :edit
    end
  end

  def edit
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Your post has been deleted"
  end

  private

  def set_post
    @posts = current_user.posts
    @post = Post.find(params[:id])
    # @post = current_user.posts.find(params)
  end

  def post_params
  	params.require(:post).permit(:title, :desc)
  end
end
