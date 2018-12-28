class UpdateNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :link, :string
  end
end
