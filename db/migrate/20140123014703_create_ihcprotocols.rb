class CreateIhcprotocols < ActiveRecord::Migration
  def change
    create_table :ihcprotocols do |t|
      t.string :tissue,              null: false
      t.string :fixation,            null: false
      t.string :first_wash,          null: false
      t.string :methpero,            null: false
      t.string :second_wash,         null: false
      t.string :blocking,            null: false
      t.string :primary_description, null: false
      t.string :third_wash,          null: false
      t.string :signal,              null: false
      t.string :fourth_wash,         null: false
      t.string :dehydration,         null: false
      t.string :mounting,            null: false
      t.string :information,         null: false
      t.integer :user_id,            null: false
      t.integer :antibody_id,        null: false

      t.timestamps
    end

    add_index :ihcprotocols, [:user_id, :antibody_id, :created_at]
  end
end
