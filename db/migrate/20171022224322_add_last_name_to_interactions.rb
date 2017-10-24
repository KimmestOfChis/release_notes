class AddLastNameToInteractions < ActiveRecord::Migration[5.1]
  def change
    add_column :interactions, :scrum_master_surname, :string
  end
end
