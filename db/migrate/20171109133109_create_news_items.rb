class CreateNewsItems < ActiveRecord::Migration[5.1]
  def change
    create_table :news_items do |t|
      t.integer :course_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
