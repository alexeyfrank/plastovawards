class CreateCompetitionStates < ActiveRecord::Migration
  def change
    create_table :competition_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
