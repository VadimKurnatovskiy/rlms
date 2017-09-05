class AddSlugs < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :slug, :string
    add_column :topics, :slug, :string
  end
end
