class Dobtointeger < ActiveRecord::Migration
  def change
  	change_column :people, :dob, 'integer USING CAST("dob" AS integer)'
  end
end
