class AddViewCountToCases < ActiveRecord::Migration
  def change
  	add_column :cases, :viewcount, :integer
  end
end
