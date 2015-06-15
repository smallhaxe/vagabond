class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :picture

      t.timestamps null: false
    end
  end
end
