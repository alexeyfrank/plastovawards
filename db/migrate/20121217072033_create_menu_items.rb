class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :slug
      t.string :ancestry
      t.string :klass
      t.integer :menu_id

      t.timestamps
    end

    add_index :menu_items, :menu_id
    add_index :menu_items, :ancestry
  end
end
