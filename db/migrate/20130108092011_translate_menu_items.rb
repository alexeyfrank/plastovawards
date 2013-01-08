class TranslateMenuItems < ActiveRecord::Migration
  def up
    MenuItem.create_translation_table!({
      :name => :string,
    }, {
      :migrate_data => true
    })
  end

  def down
    MenuItem.drop_translation_table! :migrate_data => true
  end
 
end
