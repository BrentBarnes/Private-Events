class Removeindex < ActiveRecord::Migration[7.0]
  def change
    remove_index :attendances, name: "index_attendances_on_attended_event_id"
    remove_index :attendances, name: "index_attendances_on_attendee_id"
  end
end
