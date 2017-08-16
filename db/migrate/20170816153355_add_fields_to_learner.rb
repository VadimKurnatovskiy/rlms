class AddFieldsToLearner < ActiveRecord::Migration[5.1]
  def change
    add_column :learners, :first_name, :string
    add_column :learners, :last_name, :string
  end
end
