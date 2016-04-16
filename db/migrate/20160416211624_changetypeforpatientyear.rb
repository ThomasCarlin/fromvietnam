class Changetypeforpatientyear < ActiveRecord::Migration
  def change
  	change_column :people, :startyear, 'integer USING CAST("startyear" AS integer)'
  	change_column :people, :endyear, 'integer USING CAST("endyear" AS integer)'
  end
end
