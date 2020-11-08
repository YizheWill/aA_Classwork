class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :content
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :track, null: false, foreign_key: true

      t.timestamps
    end
  end
end
