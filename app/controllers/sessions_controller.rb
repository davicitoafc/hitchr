class SessionsController < ApplicationController

    def new
      @user = User.new
    end

    def create
      if @user = login(params[:email], params[:password])
        @user = current_user
        redirect_back_or_to(root_path)
      else
        flash[:error] = 'Oops! Password or email seems to be incorrect. Please try logging in again.'
        redirect_back_or_to(root_path)
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path
    end

end
