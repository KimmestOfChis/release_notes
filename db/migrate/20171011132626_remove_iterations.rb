class RemoveIterations < ActiveRecord::Migration[5.1]
  def change
    drop_table :iterations
  end
end
