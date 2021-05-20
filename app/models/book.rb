# frozen_string_literal: true

class Book < ApplicationRecord
  has_one_attached :cover
  paginates_per 5
end
