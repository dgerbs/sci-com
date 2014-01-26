class CreateIbprotocols < ActiveRecord::Migration
  def change
    create_table :ibprotocols do |t|
      t.string :cell_tissue,           null: false
      t.string :lysis,                 null: false
      t.string :sonication,            null: false
      t.string :sample_size,           null: false
      t.string :sample_loading,        null: false
      t.string :gel,                   null: false
      t.string :electrophoresis,       null: false
      t.string :membrane,              null: false
      t.string :transfer,              null: false
      t.string :blocking,              null: false
      t.string :primary_description,   null: false
      t.string :first_wash,            null: false
      t.string :secondary_description, null: false
      t.string :second_wash,           null: false
      t.string :detection,             null: false
      t.string :information,           null: false
      t.integer :user_id,              null: false
      t.integer :antibody_id,          null: false

      t.timestamps
    end

    add_index :ibprotocols, [:user_id, :antibody_id, :created_at]
  end
end
