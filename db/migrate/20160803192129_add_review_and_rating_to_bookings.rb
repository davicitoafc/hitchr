class AddReviewAndRatingToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :review, :text
    add_column :bookings, :rating, :integer
  end
end
