class AddColumns < ActiveRecord::Migration
  def change
    add_column :events, :longitude, :string
    add_column :events, :latitude, :string
    add_column :events, :venue_name, :string
  end
end
