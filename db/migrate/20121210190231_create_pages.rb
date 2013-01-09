class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :author_id
      t.string :title
      t.text :content
      t.string :state

      t.timestamps
    end

    add_index :pages, :author_id
    add_index :pages, :title
    add_index :pages, :state
  end
end
