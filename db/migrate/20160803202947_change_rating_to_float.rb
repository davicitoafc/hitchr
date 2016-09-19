class ChangeRatingToFloat < ActiveRecord::Migration
  def change
    change_column :bookings, :rating, :float
  end
end
