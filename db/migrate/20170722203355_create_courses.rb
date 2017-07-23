class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.integer :teacher_id
      t.string :title
      t.text :description
      t.boolean :published, default: false
      t.timestamps
    end
  end
end
