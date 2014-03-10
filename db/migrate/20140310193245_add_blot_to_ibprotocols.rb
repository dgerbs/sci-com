class AddBlotToIbprotocols < ActiveRecord::Migration
  def change
    add_column :ibprotocols, :blot, :string
  end
end
