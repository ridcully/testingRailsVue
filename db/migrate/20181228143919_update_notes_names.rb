class UpdateNotesNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :notes, :title, :Title
    rename_column :notes, :note, :Note
    rename_column :notes, :link, :Link
  end
end
