class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_blog, only: %i[show edit update destroy]

  def index
    @blogs = Blog.all

    if params[:query].present?
      @blogs = Blog.search_blog(params[:query])
      unless @blogs.present?
        @blogs = Blog.all       
      end
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user
    if @blog.save
      redirect_to blogs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: 'Blog actualizado exitosamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, status: :see_other, notice: 'Blog eliminado exitosamente.'
  end

  private

  def blog_params
    params.require(:blog).permit(:comment, :title, :photo)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
