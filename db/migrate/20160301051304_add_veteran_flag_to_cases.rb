class AddVeteranFlagToCases < ActiveRecord::Migration
  def change
  	add_column :cases, :isveteran, :boolean, :default => false
  end
end
