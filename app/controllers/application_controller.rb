class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_layout, :check_profile, :set_locale, :set_admin_mode

  def forbidden
    render(:file => File.join(Rails.root, 'public/404.html'), :status => 404, :layout => false)

  end

  def authorize_user
    unless current_user and current_user.is_admin?
      forbidden
    end
  end

  protected
  def set_layout
    devise_controller? ? 'devise' : 'application'
  end

  def check_profile
    if user_signed_in? and params[:controller] != :profiles.to_s and current_user.profile == nil
      redirect_to new_profile_path
    end
  end

  def set_locale
    if params.has_key?(:lang)
      cookies[:locale]=params[:lang]
    end
    I18n.locale = params[:locale] || I18n.default_locale
    if cookies.has_key?(:locale)
      I18n.locale = :en if cookies[:locale]=="en"
      I18n.locale = :fa if cookies[:locale]=="fa"
      @eng=I18n.locale==:en
    end
  end
  def set_admin_mode
    puts "SSSSSSSSSSSSSSSSSSSSSSSSSS"
    @admin_mode = (current_user and current_user.is_admin?)
    puts @admin_mode
  end
end
