# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start 'rails'
Rails.application.eager_load!
if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def prepare_user
    User.create({ email: 'some@email.com', password: 'password' })
  end

  def prepare_another_user
    User.create({ email: 'somedifferent@email.com', password: 'password123' })
  end

  def prepare_book(user, fixture)
    book = books(fixture)
    new_book = Book.new({ name: book.name, authors: book.authors, annotation: book.annotation })
    new_book.user = user
    new_book.save
    new_book
  end

  def sign_in_as(user)
    post sessions_url, params: { email: user.email, password: user.password }
  end

  def logout
    get log_out_url
  end
end
