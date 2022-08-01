class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: :creator_id

  has_many :attendances, foreign_key: "attendee_id"
  has_many :attended_events, through: :attendances

  has_many :invitations, foreign_key: "invited_user_id"
  has_many :invited_events, through: :invitations
end