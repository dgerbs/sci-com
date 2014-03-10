class AddBlotToIpreprotocols < ActiveRecord::Migration
  def change
    add_column :ipreprotocols, :blot, :string
  end
end
