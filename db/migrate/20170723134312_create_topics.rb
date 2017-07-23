class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.integer :course_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
