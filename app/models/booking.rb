class Booking < ActiveRecord::Base
  belongs_to :ride
  belongs_to :user
  has_one :review
  validates :seats, presence: true

  validate :enough_seats

  def enough_seats

    arr = [0]
    ride.bookings.all.each { |booking| arr << booking.seats }
    total_seats = arr.inject(:+)
    if total_seats >= ride.seats_available
      errors.add(:booking, "Sorry, there are no more seats available.")
    end
  end

end
