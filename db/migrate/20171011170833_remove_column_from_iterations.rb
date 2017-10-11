class RemoveColumnFromIterations < ActiveRecord::Migration[5.1]
  def change
    remove_column :iterations, :start_date
  end
end
