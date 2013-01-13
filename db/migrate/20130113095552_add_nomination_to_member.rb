class AddNominationToMember < ActiveRecord::Migration
  def change
    add_column :members, :nomination_id, :integer
  end
end
