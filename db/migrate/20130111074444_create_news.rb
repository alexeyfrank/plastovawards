class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.text :title
      t.text :content
      t.integer :author_id

      t.timestamps
    end
  end
end
