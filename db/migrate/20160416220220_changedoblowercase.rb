class Changedoblowercase < ActiveRecord::Migration
  def change
  	rename_column :people, :DOB, :dob
  end
end
