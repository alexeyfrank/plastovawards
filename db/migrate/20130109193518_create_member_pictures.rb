class CreateMemberPictures < ActiveRecord::Migration
  def change
    create_table :member_pictures do |t|
      t.string :size
      t.text :description
      t.string :create_year
      t.string :technique
      t.integer :member_id

      t.timestamps
    end
  end
end
