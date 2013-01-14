class DropAndAddStatesToMembers < ActiveRecord::Migration
  def change
    remove_column :members, :bid_state_id
    remove_column :members, :competition_state_id
    add_column :members, :state, :string
  end
end
