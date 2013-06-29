class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if login(@user.email, params[:user][:password], false)
        redirect_to lessons_path, :notice => "Signed up!"
      end
    else
      render :new
    end
  end
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
    
end
