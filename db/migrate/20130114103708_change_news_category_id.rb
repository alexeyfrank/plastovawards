class ChangeNewsCategoryId < ActiveRecord::Migration
  def change
    remove_column :news, :category_id
    add_column :news, :category_id, :integer
  end
end
