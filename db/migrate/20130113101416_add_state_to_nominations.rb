class AddStateToNominations < ActiveRecord::Migration
  def change
    add_column :nominations, :state, :string
  end
end
