class CreateAnswerVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_variants do |t|
      t.integer :question_id
      t.text :text

      t.timestamps
    end
  end
end
