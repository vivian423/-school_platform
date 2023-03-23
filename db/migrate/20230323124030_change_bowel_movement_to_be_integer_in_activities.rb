class ChangeBowelMovementToBeIntegerInActivities < ActiveRecord::Migration[7.0]
  def change
    change_column :activities, :bowel_movement, :integer, using: 'bowel_movement::integer'
  end
end
