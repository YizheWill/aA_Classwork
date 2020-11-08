class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.belongs_to :album, null: false, foreign_key: true
      t.integer :ord
      t.boolean :standard
      t.text :lyrics

      t.timestamps
    end
  end
end
