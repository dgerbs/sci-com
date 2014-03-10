class AddBlotToIhcprotocols < ActiveRecord::Migration
  def change
    add_column :ihcprotocols, :blot, :string
  end
end
