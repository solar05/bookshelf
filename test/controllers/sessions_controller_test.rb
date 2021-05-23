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
    assert_response 422
  end

  test 'should destroy session' do
    post sessions_url, params: { email: @user.email, password: @user.password }
    assert_redirected_to books_url(locale: 'en')
    get log_out_url
    assert_redirected_to log_in_url(locale: 'en')
  end
end
