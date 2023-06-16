class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "うおー！！！！！！！作成しました！！！！！！！！！！！！"
    else
      redirect_to new_blog_path, notice: "うおー！！！！！！！！！！！！作成できません！！！！！"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pblog.update(picture_params)
      redirect_to blogs_path, notice: "更新できたよ(`･ω･´)b"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "削除完了です！"
  end

  private
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
