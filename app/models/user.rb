# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :password

  before_save :encrypt_password
  validates :password, presence: true, on: :create, confirmation: true
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def self.authenticate(email, password)
    user = find_by_email(email)
    user if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  end

  def encrypt_password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end
end
