class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [:edit, :update]

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to root_path, notice: I18n.t('blog_settings_updated')
    else
      render :edit
    end
  end

  private
  def set_blog
    unless current_user.is_admin?
      return forbidden
    end
    @blog = Blog.first
  end

  def blog_params
    params.require(:blog).permit(:name, :desc)
  end
end
