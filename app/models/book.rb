# frozen_string_literal: true

class Book < ApplicationRecord
  has_one_attached :cover
  paginates_per 5
  belongs_to :user
  validates :name, presence: true, length: { minimum: 4 }
  validates :annotation, presence: true, length: { minimum: 10 }
  validates :authors, presence: true
  validates :user, presence: true
end
