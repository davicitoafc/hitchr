class Ride < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :date, :time, :seats_available, :price, :start_location, :end_location, presence: true
  validate :correct_time

  def self.search(start_loc, end_loc, date)
    where("start_location ILIKE ?", "%#{start_loc}%")
    .where("end_location ILIKE ?", "%#{end_loc}%")
    .where("cast(date as text) ILIKE ?", "%#{date.to_date}%")
  end


  def correct_time
    if date.past?
      errors.add(:date, "You cannot make a ride in the past")
    else
      return true
    end
  end

end
