class UsersController < ApplicationController
  skip_before_action :login_required 

  def index
    @users = User.all
    @rooms = Room.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to :user_profile
    else
      render "new"
    end
  end

  def account
    @user = User.find_by(id: session[:user_id])
  end
  
  def profile
    @user = User.find_by(id: session[:user_id])
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    @user = User.find_by(id: session[:user_id])
    if @user.update(user_params)
      redirect_to :user_profile,notice: "Profile was succecessfully updated."
    else
      redirect_to :user_profile,notice: "失敗しました"
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduction, :image)
  end

end
