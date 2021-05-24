# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = prepare_user
  end

  test 'should get new' do
    get log_in_path
    assert_response :success
  end

  test 'should create session' do
    post sessions_url, params: { email: @user.email, password: @user.password }
    assert_redirected_to books_url(locale: 'en')
  end

  test 'shouldn`t create session' do
    post sessions_url, params: { email: @user.email, password: 'incorrect' }
    assert_redirected_to log_in_path(locale: 'en')
  end

  test 'should destroy session' do
    post sessions_url, params: { email: @user.email, password: @user.password }
    assert_redirected_to books_url(locale: 'en')
    delete log_out_url
    assert_redirected_to log_in_url(locale: 'en')
  end

  test 'should redirect from sign up after login' do
    post sessions_url, params: { email: @user.email, password: @user.password }
    get sign_up_path
    assert_redirected_to books_url(locale: 'en')
  end
end
