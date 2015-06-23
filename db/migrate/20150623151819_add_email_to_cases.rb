class AddEmailToCases < ActiveRecord::Migration
  def change
  	add_column :cases, :email, :string
  end
end
