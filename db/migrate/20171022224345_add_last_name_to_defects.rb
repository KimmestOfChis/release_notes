class AddLastNameToDefects < ActiveRecord::Migration[5.1]
  def change
    add_column :defects, :scrum_master_surname, :string
  end
end
