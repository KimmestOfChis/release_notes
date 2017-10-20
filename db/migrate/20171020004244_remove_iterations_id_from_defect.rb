class RemoveIterationsIdFromDefect < ActiveRecord::Migration[5.1]
  def change
    remove_column :defects, :iterations_id
  end
end
