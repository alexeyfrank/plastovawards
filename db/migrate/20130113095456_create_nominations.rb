class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.string :name

      t.timestamps
    end
  end
end
