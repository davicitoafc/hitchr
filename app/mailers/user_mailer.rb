class UserMailer < ApplicationMailer

  # 1. Setup a welcome email for new users
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Hitchr!")
  end

  def deleted_user(user)
    @user = user
    mail(to: @user.email, subject: "User Profile Deleted from Hitchr!")
  end

  # 2. Setup an email for the driver to see when someone requests a seat
  def seat_confirmation(ride, booking)
    @ride = ride
    @booking = booking
    email = @ride.user.email
    mail(to:email, subject: "Somebody wants to hitch a ride with you on #{@ride.date.strftime("%b %-d, %Y")}
                            from #{@ride.start_location} to #{@ride.end_location}")
  end


  # 3. Setup an email for a rider when a driver rejects a seat request
  def seat_rejected(booking)
    @booking = booking
    email = @booking.user.email
    mail(to:email, subject: "You were DECLINED for your ride on
                            #{@booking.ride.date.strftime("%b %-d, %Y")} from
                            #{@booking.ride.start_location} to #{@booking.ride.end_location}")
  end

  # 4. Setup an email when a booked seat is cancelled by a rider

  def cancelled_seat(booking)
    @booking = booking

    email = @booking.ride.user.email
    mail(to:email, subject: "#{@booking.user.first_name} #{@booking.user.last_name}
                              cancelled their seat(s) for your ride on
                              #{@booking.ride.date.strftime("%b %-d, %Y")} from
                              #{@booking.ride.start_location} to #{@booking.ride.end_location}")
  end

  # 5. Setup an email when a ride is cancelled by a driver

  def cancelled_ride(ride)
    @ride = ride

    @ride.bookings.each do |booking|
      email = booking.user.email
      @booking = booking
      mail(to: email, subject: "Your ride from #{ride.start_location} to
      #{ride.end_location} on #{@ride.date.strftime("%b %-d, %Y")} has been cancelled!")
    end
  end

  def complete_ride(ride)
    @ride = ride

    @ride.bookings.each do |booking|
      email = booking.user.email
      @booking = booking
      mail(to: email, subject: "Your ride from #{@ride.start_location} to
      #{@ride.end_location} on #{@ride.date.strftime("%b %-d, %Y")} has been completed!")
    end
  end

end
