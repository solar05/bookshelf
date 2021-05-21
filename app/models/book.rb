# frozen_string_literal: true

class Book < ApplicationRecord
  has_one_attached :cover
  paginates_per 5
  validates :name, presence: true, length: { minimum: 4 }
  validates :annotation, presence: true, length: { minimum: 10 }
  validates :authors, presence: true
end
