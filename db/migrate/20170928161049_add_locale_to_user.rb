class AddLocaleToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :locale, :string, default: "ru"
    add_column :learners, :locale, :string, default: "ru"
  end
end
