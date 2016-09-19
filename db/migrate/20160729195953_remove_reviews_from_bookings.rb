class RemoveReviewsFromBookings < ActiveRecord::Migration
  def change
    remove_column :reviews, :booking_id, :integer
  end
end
