class RemoveDimentionFromMemberPictures < ActiveRecord::Migration
  def change
    remove_column :member_pictures, :width
    remove_column :member_pictures, :height
  end
end
