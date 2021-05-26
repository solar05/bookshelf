# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :ensure_logged

  def ensure_logged
    return unless current_user

    respond_to do |format|
      format.html { redirect_to books_url, notice: t('flash.session.already_logged') }
    end
  end

  helper_method :require_login

  def require_login
    return if current_user

    respond_to do |format|
      format.html { redirect_to log_in_path, alert: t('flash.session.login_required') }
      format.json { head :no_content, status: 401 }
    end
  end
end
