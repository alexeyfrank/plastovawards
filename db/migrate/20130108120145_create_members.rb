class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :birth_year
      t.string :country
      t.string :city
      t.string :phone
      t.string :email
      t.integer :competition_state_id
      t.integer :bid_state_id

      t.timestamps
    end
    add_index :members, :competition_state_id
    add_index :members, :bid_state_id
  end
end
