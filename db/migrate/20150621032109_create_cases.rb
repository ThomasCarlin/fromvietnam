class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :name
      t.string :DOB
      t.string :birthplace
      t.string :race
      t.string :mothername
      t.string :place
      t.string :motherdetails
      t.string :fathername
      t.string :state
      t.string :position
      t.string :place
      t.string :time 
      t.string :occupation
      t.string :fatherdetails

      t.timestamps null: false
    end
  end
end
