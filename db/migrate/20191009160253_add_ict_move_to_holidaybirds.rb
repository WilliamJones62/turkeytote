class AddIctMoveToHolidaybirds < ActiveRecord::Migration[5.1]
  def change
    add_column :holidaybirds, :ict_move, :integer
  end
end
