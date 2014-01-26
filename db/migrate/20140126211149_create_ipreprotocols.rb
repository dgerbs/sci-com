class CreateIpreprotocols < ActiveRecord::Migration
  def change
    create_table :ipreprotocols do |t|
      t.string :cell,                  null: false
      t.string :lysis,                 null: false
      t.string :sonication,            null: false
      t.string :sample_concentration,  null: false
      t.string :preclearing,           null: false
      t.string :primary_description,   null: false
      t.string :ab_capture,            null: false
      t.string :first_wash,            null: false
      t.string :sample_prep,           null: false
      t.string :gel,                   null: false
      t.string :electrophoresis,       null: false
      t.string :membrane,              null: false
      t.string :transfer,              null: false
      t.string :blocking,              null: false
      t.string :secondary_description, null: false
      t.string :second_wash,           null: false
      t.string :tertiary_description,  null: false
      t.string :third_wash,            null: false
      t.string :detection,             null: false
      t.string :information,           null: false
      t.integer :user_id,              null: false
      t.integer :antibody_id,          null: false

      t.timestamps
    end

    add_index :ipreprotocols, [:user_id, :antibody_id, :created_at]
  end
end
