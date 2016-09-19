class RemoveReviewFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :booking_id, :integer
  end
end
