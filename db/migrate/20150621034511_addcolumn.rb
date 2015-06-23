class Addcolumn < ActiveRecord::Migration
  def change
  	add_column :cases, :country, :string
  end
end
