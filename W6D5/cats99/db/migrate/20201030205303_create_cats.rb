class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.text :color, null: false
      t.text :name, null: false
      t.text :description, null: false 
      t.string :sex, limit: 1, null: false

      t.date :birth_date, null: false 
      
      

      t.timestamps
    end
  end
end
