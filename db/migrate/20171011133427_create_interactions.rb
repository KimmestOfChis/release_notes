class CreateInteractions < ActiveRecord::Migration[5.1]
  def change
    create_table :interactions do |t|
      t.string :interaction_name
      t.string :interface
      t.string :notes_from_release
      t.boolean :data_mapping
      t.string :rrc_version
      t.boolean :plt_crossline_dep
      t.string :plt_dep_dets
      t.boolean :pc_changes
      t.string :pc_changes_type
      t.boolean :plugin_changes
      t.string :plug_changes_type
      t.boolean :ia_changes
      t.string :ia_changes_type
      t.boolean :db_script
      t.string :db_script_type
      t.boolean :external_changes
      t.string :external_changes_type
      t.string :issues_defects
      t.text :workarounds

      t.timestamps
    end
  end
end
