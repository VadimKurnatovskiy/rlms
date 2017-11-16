class AddForeignKeyForNewsItems < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :news_items, :courses
    change_column_null(:news_items, :course_id, false)
  end
end
