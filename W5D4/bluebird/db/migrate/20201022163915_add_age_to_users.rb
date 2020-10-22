class AddAgeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer, null: false
    # add_column 是activeRecord的build in function。
  end
end
