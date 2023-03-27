class AddDateToAnnouncements < ActiveRecord::Migration[7.0]
  def change
    add_column :announcements, :date, :datetime
  end
end
