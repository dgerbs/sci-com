class CreateFlowprotocols < ActiveRecord::Migration
  def change
    create_table :flowprotocols do |t|
      t.string :cell,                  null: false
      t.string :fixation,              null: false
      t.string :incubation,            null: false
      t.string :permeabilization,      null: false
      t.string :cell_number,           null: false
      t.string :first_wash,            null: false
      t.string :immunostain_vol,       null: false
      t.string :primary_description,   null: false
      t.string :second_wash,           null: false
      t.string :secondary_description, null: false
      t.string :third_wash,            null: false
      t.string :final_vol,             null: false
      t.string :information,           null: false
      t.integer :user_id,              null: false
      t.integer :antibody_id,          null: false

      t.timestamps
    end
    
    add_index :flowprotocols, [:user_id, :antibody_id, :created_at]
  end
end
