class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :Name
      t.string :Street
      t.string :AdditionStreet
      t.string :City
      t.string :PostCode
      t.string :Province
      t.string :Country

      t.float :Latitude
      t.float :Longitude

      t.timestamps
    end
  end
end
