class CreateVeterans < ActiveRecord::Migration
  def change
    create_table :veterans do |t|
      t.string :name
      t.string :DOB
      t.string :race
      t.string :country
      t.string :state
      t.string :branch
      t.string :position
      t.string :place
      t.string :time 
      t.string :occupation
      t.string :fatherdetails
      t.string :mothername
      t.string :place
      t.string :motherdetails
      t.string :email
      t.string :images
      t.string :story

      t.timestamps null: false
    end
  end
end
