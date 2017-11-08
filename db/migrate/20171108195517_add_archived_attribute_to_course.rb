class AddArchivedAttributeToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :archived, :boolean, default: false
  end
end
