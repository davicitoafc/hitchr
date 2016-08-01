class HomeController < ApplicationController


  def index
    @user = current_user || User.new
    @rides = Ride.limit(4)
    search
  end

  def search
    if (params[:start_location] && params[:end_location]) && params[:date]
      @rides = Ride.search(params[:start_location], params[:end_location], params[:date]).order("created_at DESC")
      respond_to do |format|
        format.html { render partial: 'search' }
        format.json { render json: @rides }
      end
    else
      render :index
    end
  end



end
