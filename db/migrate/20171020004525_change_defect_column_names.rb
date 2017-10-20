class ChangeDefectColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :defects, :plugin_changes, :plugin_changes_def
    rename_column :defects, :ia_changes, :ia_changes_def
  end
end
