# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :text, presence: true

  has_many :comments, dependent: :destroy
end
