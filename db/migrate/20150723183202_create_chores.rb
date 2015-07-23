class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :name
      t.string :done
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
