class AddReviewToBooking < ActiveRecord::Migration
  def change
    add_foreign_key :review
  end
end
