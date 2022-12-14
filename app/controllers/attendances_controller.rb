class AttendancesController < ApplicationController
  def new
    @event = Event.find(attendance_params)
  end

  def show
    @attendance = current_user.attendances
  end

  def index
    @attendance = current_user.attendances
  end

  def create
    @attendance = Attendance.create(attendance_params)
    @attendance.save
    flash[:notice] = "You have successfully registered for the event."
    redirect_to root_path
  end

  def destroy
    @attendance = Attendance.find_by(attended_event_id: params[:id]).destroy
    
    flash[:notice] = "You have successfully withdrew from this event."
    redirect_to attendances_path
  end


  private

  def attendance_params
    params.require(:attendance).permit(:attendee_id, :attended_event_id)
  end
end
