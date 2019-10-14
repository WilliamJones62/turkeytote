class AddChannelMoveToHolidaybirds < ActiveRecord::Migration[5.1]
  def change
    add_column :holidaybirds, :channel_move, :integer
  end
end
