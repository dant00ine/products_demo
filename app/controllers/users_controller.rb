class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(name:params[:name], email:params[:email], password:params[:password])
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to "/products"
    else
      flash[:errors] = ["Didn't work man"]
      redirect_to "/register"
    end
  end

  def edit
  end
end
