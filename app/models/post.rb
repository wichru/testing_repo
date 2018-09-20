# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }, uniqueness: true
  validates :text, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user

  def tags=(obj)
    if obj.is_a?(String)
      super sanitize_tags(obj)
    else
      super
    end
  end

  private

  def sanitize_tags(text)
    text.split.map(&:downcase).uniq
  end
end
