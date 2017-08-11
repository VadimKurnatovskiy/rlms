class RemoveUnusedFieldsFromTopic < ActiveRecord::Migration[5.1]
  def change
    remove_column :topics, :content
    remove_column :topics, :description
  end
end
