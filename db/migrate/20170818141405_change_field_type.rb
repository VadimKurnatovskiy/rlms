class ChangeFieldType < ActiveRecord::Migration[5.1]
  def change
    change_column :answer_variants, :text, :string
  end
end
