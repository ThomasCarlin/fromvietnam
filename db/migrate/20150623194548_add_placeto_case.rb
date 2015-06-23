class AddPlacetoCase < ActiveRecord::Migration
  def change
  	add_column :cases, :placeofduty, :string
  end
end
