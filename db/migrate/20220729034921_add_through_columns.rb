class AddThroughColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :attendances, :attendee_id, :integer
    add_column :attendances, :attended_event_id, :integer
  end
end
