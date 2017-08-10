class AddOrderIndexToTopic < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :order_index, :integer
  end
end
