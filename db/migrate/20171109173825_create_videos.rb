class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.integer :material_id
      t.string :title
      t.text :link

      t.timestamps
    end
  end
end
