class AddBlotToIfprotocols < ActiveRecord::Migration
  def change
    add_column :ifprotocols, :blot, :string
  end
end
