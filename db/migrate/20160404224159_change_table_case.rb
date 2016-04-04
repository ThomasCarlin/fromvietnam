class ChangeTableCase < ActiveRecord::Migration
  def change
  	rename_table :cases, :persons
  end
end
