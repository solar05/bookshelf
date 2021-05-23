# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :check_auth

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to log_in_url, notice: t('flash.session.signed') }
        format.json { head :no_content, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def check_auth
    return unless current_user

    respond_to do |format|
      format.html { redirect_to books_url, notice: t('flash.session.already_logged') }
    end
  end
end
