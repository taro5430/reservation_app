class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.all
  end

  def confirm
    @room = current_user.rooms.find(params[:room_id])
    @reservation = Reservation.new(reservation_params)
    if @reservation.people.nil? || @reservation.start_date.nil? || @reservation.end_date.nil?
      flash[:danger] = "開始日と終了日と人数は必須です"
      redirect_to room_path(params[:room_id])
    elsif @reservation.date_before_start
      flash[:danger] = "開始日は本日以降の日付にしてください"
      redirect_to room_path(params[:room_id])
    elsif @reservation.date_before_end
      flash[:danger] = "終了日は開始日以降の日付にしてください"
      redirect_to room_path(params[:room_id])
    end
  end

  def create
    @room = current_user.rooms.find(params[:room_id])
    @reservation = Reservation.create(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation.id)
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @room = current_user.rooms.find(@reservation.room_id)
    @user = User.find_by(id: session[:user_id])
    flash[:notice] = "Reservation was successfully created."
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :people, :room_id, :user_id)
  end 


end
