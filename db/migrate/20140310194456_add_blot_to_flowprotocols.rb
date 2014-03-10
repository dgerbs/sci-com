class AddBlotToFlowprotocols < ActiveRecord::Migration
  def change
    add_column :flowprotocols, :blot, :string
  end
end
