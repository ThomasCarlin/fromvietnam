class Addplaceofduty < ActiveRecord::Migration
  def change
  	add_column :veterans, :placeofduty, :string
  end
end
