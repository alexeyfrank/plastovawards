class AddFileFieldsForPicture < ActiveRecord::Migration
  def change
    add_column :member_pictures, :main_page_type, :integer
    add_column :member_pictures, :main_page_width, :integer
    add_column :member_pictures, :main_page_height, :integer
    
    add_column :member_pictures, :gallery_type, :integer
    add_column :member_pictures, :gallery_width, :integer
    add_column :member_pictures, :gallery_height, :integer
  end
end
