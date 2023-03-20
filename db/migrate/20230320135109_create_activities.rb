class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.references :kid, null: false, foreign_key: true
      t.string :bowel_movement
      t.integer :nap_duration
      t.references :user, null: false, foreign_key: true
      t.datetime :date
      t.string :snack
      t.string :snack_consumption
      t.string :lunch
      t.string :lunch_consumption
      t.string :overall_mood

      t.timestamps
    end
  end
end
