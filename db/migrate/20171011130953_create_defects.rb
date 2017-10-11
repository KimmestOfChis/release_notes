class CreateDefects < ActiveRecord::Migration[5.1]
  def change
    create_table :defects do |t|
      t.references :iterations, foreign_key: true
      t.string :defect_no
      t.string :rtc
      t.string :qc
      t.string :config
      t.boolean :data_mapping_def
      t.boolean :pc_changes_def
      t.boolean :plugin_changes
      t.boolean :ia_changes
      t.boolean :db_changes_def
      t.boolean :external_changes_def
      t.text :workarounds

      t.timestamps
    end
  end
end
