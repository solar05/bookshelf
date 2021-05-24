# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:email], params[:password])
    respond_to do |format|
      if user
        session[:user_id] = user.id
        format.html { redirect_to books_url, notice: t('flash.session.logged') }
      else
        format.html { redirect_to log_in_path, alert: t('flash.session.incorrect_credentionals') }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to log_in_url, notice: t('flash.session.logged_out') }
    end
  end
end
