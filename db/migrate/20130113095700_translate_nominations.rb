class TranslateNominations < ActiveRecord::Migration
  def up
    Nomination.create_translation_table!({
      :name => :string
    }, {
      :migrate_data => true
    })
  end

  def down
    Nomination.drop_translation_table! :migrate_data => true
  end
end
