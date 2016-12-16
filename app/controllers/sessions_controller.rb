class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user == nil
      flash[:errors] = ["email has not been registered"]
      return redirect_to "/login"
    end

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/products"
    else
      flash[:errors] = ["invalid password"]
      redirect_to "/login"
    end
  end

  def destroy
    reset_session
    redirect_to "/login"
  end
end
