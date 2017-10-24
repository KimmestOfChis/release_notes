class AddScrumMasterNamesToInteractions < ActiveRecord::Migration[5.1]
  def change
    add_column :interactions, :scrum_master, :string
  end
end
