class AddColumn < ActiveRecord::Migration
  def change
    add_column :chores, :client_id, :integer
  end
end
