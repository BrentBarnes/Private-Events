class AttendancesController < ApplicationController
  def new
    @event = Event.find(attendance_params)
  end

  def show
    @attendance = current_user.attendances
  end

  # def index
  #   @attendance = current_user.attendances
  # end

  def create
    @event = Event.find(attendance_params)
    @event.attendees << current_user
    flash[:notice] = "You have registered for the event."
    redirect_to root_path
  end


  private

  def attendance_params
    params.require(:attendance).permit(:attendee_id, :attended_event_id)
  end
end