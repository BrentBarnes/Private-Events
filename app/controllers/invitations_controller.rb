class InvitationsController < ApplicationController
  before_action :set_event, only: [:create]
  before_action :set_user, only: [:create]
  before_action :check_if_invitation_exists, only: [:create]

  def new
    @invitation = Invitation.new
  end

  def create
    ip = invitation_params
    found_user = Invitation.get_invited_user(params[:invitation][:invited_user_email])
    ip[:invited_user_id] = found_user.id

    @invitation = found_user.invitations.find_or_create_by(invitation_params)
    if @invitation.save
      flash[:notice] = "Your invitation has been successfully sent"
      redirect_to new_invitation_path(invited_event_id: found_user.id)
    else
      ip[:invited_event_id] = found_user.id
      render :action => "new", status: :unprocessable_entity
    end
  end

  private

  def invitation_params
    params.permit(:invited_user_id, :invited_event_id, :invited_user_email)
  end

  def set_event
    @event = Event.find(params[:invited_event_id])
  end

  def set_user
    @user = User.find_by(email: params[:invited_user_email])
  end

  def check_if_invitation_exists
    found_invitation = Invitation.find_by_invited_user_email(params[:invitation][:invited_user_email])
    binding.pry
    if found_invitation.nil?
      flash.now[:error] = "There is no user with this email."
      render "new", status: :unprocessable_entity 
    elsif Invitation.exists?(email: found_invitation.invited_user_email)
      flash.now[:error] = "User exists."
      #                       invited_user_id: found_invitation.invited_user_id,
      #                       invited_event_id: found_invitation.invited_event_id)
      #   flash.now[:error] = "This person is already invited."
      #   render "new", status: :unprocessable_entity
    end


  end
end
