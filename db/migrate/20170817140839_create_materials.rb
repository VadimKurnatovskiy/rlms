class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.integer :topic_id
      t.string :link
      t.string :attachment

      t.timestamps
    end
  end
end
