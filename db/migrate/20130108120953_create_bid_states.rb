class CreateBidStates < ActiveRecord::Migration
  def change
    create_table :bid_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
