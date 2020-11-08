class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.belongs_to :band, null: false, foreign_key: true
      t.boolean :live, default: false
      t.integer :year, null: false

      t.timestamps
    end
  end
end
