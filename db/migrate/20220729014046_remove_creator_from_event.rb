class RemoveCreatorFromEvent < ActiveRecord::Migration[7.0]
  def change
    remove_index :events, name: "index_events_on_creator_id"
  end
end
