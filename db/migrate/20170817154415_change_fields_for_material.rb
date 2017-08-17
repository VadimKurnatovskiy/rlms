class ChangeFieldsForMaterial < ActiveRecord::Migration[5.1]
  def change
    remove_column :materials, :link

    add_column :materials, :title,       :string
    add_column :materials, :order_index, :integer
  end
end
