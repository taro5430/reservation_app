class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms.all
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = current_user.rooms.new(room_params)
    if @room.save
      flash[:notice] = "Room was successfully created."
      redirect_to @room
    else
      flash[:notice] = "失敗しました"
      render "new"
    end
  end

  def show
    @room = current_user.rooms.find(params[:id])
    @user = User.find_by(id: session[:user_id])
    @reservation = Reservation.new
  end

  def search
    if params[:address].present?
      @rooms = Room.search(params[:address])
    elsif params[:keyword].present?
      @rooms = Room.search(params[:keyword])
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :image)
  end

end
