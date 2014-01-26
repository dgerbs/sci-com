class CreateIfprotocols < ActiveRecord::Migration
  def change
    create_table :ifprotocols do |t|
      t.string :cell,                  null: false
      t.string :fixation,              null: false
      t.string :first_wash,            null: false
      t.string :blocking,              null: false
      t.string :primary_description,   null: false
      t.string :second_wash,           null: false
      t.string :secondary_description, null: false
      t.string :third_wash,            null: false
      t.string :coverslip,             null: false
      t.string :information,           null: false
      t.integer :user_id,              null: false
      t.integer :antibody_id,          null: false

      t.timestamps
    end

    add_index :ifprotocols, [:user_id, :antibody_id, :created_at]
  end
end
