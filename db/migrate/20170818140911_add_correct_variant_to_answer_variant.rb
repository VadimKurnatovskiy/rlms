class AddCorrectVariantToAnswerVariant < ActiveRecord::Migration[5.1]
  def change
    add_column :answer_variants, :correct, :boolean
  end
end
