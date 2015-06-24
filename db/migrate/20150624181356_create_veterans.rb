class CreateVeterans < ActiveRecord::Migration
  def change
    create_table :veterans do |t|
      t.string :name
      t.string :race
      t.string :place
      t.string :motherdetails
      t.string :state
      t.string :position
      t.string :time 
      t.string :occupation
      t.string :fatherdetails
      t.string :story
      t.timestamps null: false
    end
  end
end
