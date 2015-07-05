class Addstartyearendyeartoveterans < ActiveRecord::Migration
  def change
   	add_column :veterans, :startyear, :string
  	add_column :veterans, :endyear, :string
  end
end
