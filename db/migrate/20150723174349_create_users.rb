class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :email
      t.string :password

      t.timestamps null: false
    end
  end
end
