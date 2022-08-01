class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key "attendances", "users", column: "attendee_id"
    add_foreign_key "attendances", "events", column: "attended_event_id"
  end
end
