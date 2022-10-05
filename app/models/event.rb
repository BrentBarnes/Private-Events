class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :attendances, foreign_key: "attended_event_id"
  has_many :attendees, through: :attendances

  has_many :invitations, foreign_key: "invited_event_id"
  has_many :invited_users, through: :invitations
  
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true

  scope :future_events, -> { where("date >= ?", Date.today) }
  scope :past_events, -> { where("date < ?", Date.today) }

  def self.future
    where("date >= ?", Date.today)
  end

  def self.past
    where("date < ?", Date.today)
  end
end
