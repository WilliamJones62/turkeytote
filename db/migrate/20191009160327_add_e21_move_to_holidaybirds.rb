class AddE21MoveToHolidaybirds < ActiveRecord::Migration[5.1]
  def change
    add_column :holidaybirds, :e21_move, :integer
  end
end
