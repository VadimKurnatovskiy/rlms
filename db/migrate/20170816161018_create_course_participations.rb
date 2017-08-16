class CreateCourseParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :course_participations do |t|
      t.integer :course_id
      t.integer :learner_id

      t.timestamps
    end
  end
end
