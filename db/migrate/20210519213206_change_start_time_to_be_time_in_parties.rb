class ChangeStartTimeToBeTimeInParties < ActiveRecord::Migration[5.2]
  def change
    change_column :parties, :start_time, 'time USING CAST(start_time AS time)'
  end
end