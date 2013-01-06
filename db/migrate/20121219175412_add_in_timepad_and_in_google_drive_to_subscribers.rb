class AddInTimepadAndInGoogleDriveToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :in_timepad, :boolean
    add_column :subscribers, :in_google_drive, :boolean
  end
end
