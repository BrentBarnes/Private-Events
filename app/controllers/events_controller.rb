class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash.now[:notice] = "Your event has been successfully created."
      redirect_to event_path(@event)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash.now[:notice] = "Your event has been successfully updated."
      redirect_to event_path(@event)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "Your event was successfully destroyed."
    redirect_to user_show_path
  end


  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location, :creator_id)
  end
end
