class AddPositionToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :position, :integer
    add_index :menu_items, :position
  end
end
