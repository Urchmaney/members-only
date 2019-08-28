class SessionsController < ApplicationController
    def new
      if logged_in?
        flash[:danger] = 'You Have already logged in'
        redirect_to posts_path
      end
    end
  
    def create
      @user = User.find_by(email: params[:session][:email].downcase)
  
      if @user&.authenticate(params[:session][:password])
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or posts_url
      else
        flash.now[:danger] = 'Oops! Invalid email/password combination'
        render 'new'
      end
    end
  
    def destroy
      log_out if logged_in?
      redirect_to root_url
    end
  end
  