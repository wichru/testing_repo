# frozen_string_literal: true

class UserIdAssociate < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :user
  end
end
