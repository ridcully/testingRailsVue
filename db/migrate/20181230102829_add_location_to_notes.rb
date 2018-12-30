class AddLocationToNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :notes, :location
  end
end
