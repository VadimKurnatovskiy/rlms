class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.integer :topic_id
      t.string :title
      t.string :attachment

      t.timestamps
    end
  end
end
