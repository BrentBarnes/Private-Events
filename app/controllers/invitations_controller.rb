class InvitationsController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :set_event, only: [:create]
  before_action :check_if_invitation_exists, only: [:create]

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = @user.invitations.build(invited_user_id: @user.id, invited_event_id: @event.id)
    if @invitation.save
      flash[:notice] = "Your invitation has successfully been sent"
      redirect_to new_invitation_path(invitation: {invited_event_id: @event.id})
    else
      render :action => "new", status: :unprocessable_entity
    end
  end

  private

  def invitation_params
    params.permit(:invited_user_id, :invited_event_id, :invited_user_email)
  end

  def set_event
    @event = Event.find(params[:invitation][:invited_event_id])
  end

  def set_user
    @user = User.find_by(email: params[:invitation][:invited_user_email])
  end

  def check_if_invitation_exists
    if @user.nil?
      flash[:notice] = "There is no user with this email."
      redirect_to new_invitation_path(invitation: {invited_event_id: @event.id})
    elsif Invitation.where(invited_event_id: @event.id, invited_user_id: @user.id).exists?
      flash[:notice] = "This user has already received an invite."
      redirect_to new_invitation_path(invitation: {invited_event_id: @event.id})
    end
  end
end
