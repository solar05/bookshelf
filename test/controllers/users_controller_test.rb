# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get sign_up_path
    assert_response :success
  end

  test 'should create user' do
    post users_url, params: { user: { email: 'dummy@email', password: 'password' } }
    assert_redirected_to log_in_path(locale: 'en')
  end

  test 'shouldn`t create user' do
    post users_url, params: { user: { email: 'email', password: 'pswd' } }
    assert_response 422
  end
end
