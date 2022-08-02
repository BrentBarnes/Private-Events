class Invitation < ApplicationRecord
  belongs_to :invited_user, class_name: "User"
  belongs_to :invited_event, class_name: "Event"

  def self.get_invited_user(email)
    user = User.find_by("email = ?", email)
  end
end
