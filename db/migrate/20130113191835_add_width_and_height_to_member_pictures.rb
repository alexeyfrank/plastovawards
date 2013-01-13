class AddWidthAndHeightToMemberPictures < ActiveRecord::Migration
  def change
    add_column :member_pictures, :width, :integer
    add_column :member_pictures, :height, :integer
  end
end
