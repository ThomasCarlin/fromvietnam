class Changetypeforpatientyear < ActiveRecord::Migration
  def change
  	change_column :people, :startyear, :integer
  	change_column :people, :endyear, :integer
  end
end
