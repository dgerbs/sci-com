class AddStatsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :occupation, :string
    add_column :users, :interests, :string
  end
end
