class AddInvitedUserEmailToInvitations < ActiveRecord::Migration[7.0]
  def change
    add_column :invitations, :invited_user_email, :string
  end
end
