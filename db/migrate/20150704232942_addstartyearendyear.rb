class Addstartyearendyear < ActiveRecord::Migration
  def change
  	add_column :cases, :startyear, :string
  	add_column :cases, :endyear, :string
  end
end
