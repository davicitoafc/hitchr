class Booking < ActiveRecord::Base
  belongs_to :ride
  belongs_to :user
  validates :seats, presence: true
  validates_presence_of :rating, on: :update

  validate :enough_seats, :booking_to_zero


  def enough_seats
    arr = [0]
    ride.bookings.each { |booking| arr << booking.seats }
    total_seats = arr.inject(:+)
    if total_seats > ride.seats_available
      errors.add(:booking, "unavailable , there are no more seats left.")
    end
  end

  def booking_to_zero
    if rating == nil
      rating = 0
    end
  end

end
