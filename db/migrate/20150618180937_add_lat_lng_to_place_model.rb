class AddLatLngToPlaceModel < ActiveRecord::Migration
  def change
    add_column :places, :lat, :numeric
    add_column :places, :lng, :numeric
  end
end
