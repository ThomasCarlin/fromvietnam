class Addbranchtocase < ActiveRecord::Migration
  def change
  	add_column :cases, :branch, :string
  end
end
