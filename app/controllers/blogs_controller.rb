class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :edit_for_new_blogs, only: [:edit, :update]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      #same as "/blogs/#{@blog.id}"
      #same as blog_path(@blog)
      redirect_to @blog
    else
      render :new
    end
  end

  def show
    # @blog.increment(:view_count)
    @blog.view_count += 1
    @blog.save
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :body)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end

    def edit_for_new_blogs
      redirect_to blogs_path if @blog.view_count > 10
    end
end