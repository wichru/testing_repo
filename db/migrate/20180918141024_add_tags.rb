class AddTags < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :tags, :text, array: true, default: []
  end
end
