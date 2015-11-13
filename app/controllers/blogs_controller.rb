class BlogsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :edit_for_new_blogs, only: [:edit, :update]
  before_action :check_correct_user, only: [:edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    # @blog = Blog.new(blog_params.merge(user: current_user))
    # @blog = Blog.new(blog_params.merge(user_id: current_user.id))
    @blog = current_user.blogs.new(blog_params)
    if @blog.save

      params[:blog][:tags_names].gsub(/ /, "").split(",").each do |tag_name|
        @blog.tags.create(name: tag_name)
      end
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
      @blog.tags.destroy_all
      params[:blog][:tags_names].gsub(/ /, "").split(",").each do |tag_name|
        @blog.tags.create(name: tag_name)
      end
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

    def check_correct_user
      unless @blog.user == current_user
        flash[:danger] = "Unauthorized"
        redirect_to blogs_path 
      end
    end
end