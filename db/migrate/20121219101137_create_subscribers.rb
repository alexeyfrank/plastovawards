class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :fio
      t.string :phone
      t.boolean :processing_personal_data
      t.boolean :notify_about_center_events

      t.timestamps
    end

    add_index :subscribers, :email
    add_index :subscribers, :processing_personal_data
    add_index :subscribers, :notify_about_center_events
  end
end
