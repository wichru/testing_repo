# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :body, presence: true
  validates :commenter, presence: true, length: { minimum: 3 }

  belongs_to :post
end
