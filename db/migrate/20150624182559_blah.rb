class Blah < ActiveRecord::Migration
  def change
  	add_column  :cases, :story, :string
  end
end
