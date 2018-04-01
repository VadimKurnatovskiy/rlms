class RemovePublishedFromTopics < ActiveRecord::Migration[5.1]
  def change
    remove_column :topics, :published, :boolean
  end
end
