class AddContentToTopic < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :content, :text, default: ""
  end
end
