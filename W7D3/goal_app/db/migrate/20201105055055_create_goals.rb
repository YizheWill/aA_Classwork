class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :details
      t.boolean :private, default: false
      t.boolean :completed, default: false
      t.integer :cheers, default: 12
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
