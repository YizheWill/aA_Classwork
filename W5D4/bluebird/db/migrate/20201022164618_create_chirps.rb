class CreateChirps < ActiveRecord::Migration[5.2]
  def change
    create_table :chirps do |t|
      t.text :body, null: false
      # string <= 255, text longer
      t.integer :author_id, null: false
    end

    add_index :chirps, :author_id # cannot unique this one, can have a lot of authors in the table
  end
end
