class Addimagecolumntocase < ActiveRecord::Migration
  def change
  	add_column :cases, :images, :string
  end
end
