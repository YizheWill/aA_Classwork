class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :author, foreign_key: true
      t.integer :user_commented_on, foreign_key: true
      t.belongs_to :goal, foreign_key: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
