class AddFieldsToIteration < ActiveRecord::Migration[5.1]
  def change
    add_column :iterations, :iteration_name, :string
    add_column :iterations, :interface, :name
    add_column :iterations, :notes_from_release, :string
    add_column :iterations, :data_mapping, :boolean
    add_column :iterations, :rrc_version, :string
    add_column :iterations, :plt_crossline_dep, :boolean
    add_column :iterations, :plt_dep_dets, :string
    add_column :iterations, :pc_changes, :boolean
    add_column :iterations, :pc_changes_type, :string
    add_column :iterations, :plugin_changes, :boolean
    add_column :iterations, :plug_changes_type, :string
    add_column :iterations, :ia_changes, :boolean
    add_column :iterations, :ia_changes_type, :string
    add_column :iterations, :db_script, :boolean
    add_column :iterations, :db_script_type, :string
    add_column :iterations, :external_changes, :boolean
    add_column :iterations, :external_changes_type, :string
    add_column :iterations, :issues_defects, :string
    add_column :iterations, :workarounds, :text
  end
end
