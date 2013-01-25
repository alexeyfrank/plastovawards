class TranslateNewsCategories < ActiveRecord::Migration
  def up
    NewsCategory.create_translation_table!({
      :title => :string,
    }, {
      :migrate_data => true
    })
  end

  def down
    NewsCategory.drop_translation_table! :migrate_data => true
  end
end
