class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      flash[:notice] = "Your invitation has been successfully sent"
      redirect_to new_invitation_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:invited_user_id, :invited_event_id)
  end

end
