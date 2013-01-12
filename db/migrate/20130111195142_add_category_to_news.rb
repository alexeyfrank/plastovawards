class AddCategoryToNews < ActiveRecord::Migration
  def change
    add_column :news, :category_id, :string
  end
end
