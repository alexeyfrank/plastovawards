class AddFileToMemberPictures < ActiveRecord::Migration
  def change
    add_column :member_pictures, :file, :string
  end
end
