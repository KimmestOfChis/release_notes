class AddScrumMasterNamesToDefects < ActiveRecord::Migration[5.1]
  def change
    add_column :defects, :scrum_master, :string
  end
end
