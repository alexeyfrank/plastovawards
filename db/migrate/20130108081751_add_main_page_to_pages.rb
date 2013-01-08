class AddMainPageToPages < ActiveRecord::Migration
  def change
    add_column :pages, :is_home_page, :boolean
  end
end
