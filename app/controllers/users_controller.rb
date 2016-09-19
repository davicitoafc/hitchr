class UsersController < ApplicationController

  # before_action :require_login, only: :show
  def new
    @user = User.new
  end

  def show
    @alt_color = true
    @user = User.find(params[:id])
    @rides = @user.rides

    @total_rating = [4]
    @rides.each do |ride|
      ride.bookings.each do |booking|
        unless booking.rating.nil?
          @total_rating << booking.rating
        end
      end
    end

      @average_rating = @total_rating.compact.inject(:+) / @total_rating.length
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.welcome(@user).deliver_later
      session[:user_id] = @user.id
      redirect_to @user, alert: "Thanks for signing up to Hitchr, #{@user.first_name}!"
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_back_or_to(root_path)
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
   @user = User.find(params[:id])
   UserMailer.deleted_user(@user).deliver_later
   @user.rides.delete_all
   @user.bookings.delete_all
   @user.destroy
   flash[:success] = "User deleted"
   redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :gender, :date_of_birth, :reliability, :avatar, :phone_number)
  end

end
