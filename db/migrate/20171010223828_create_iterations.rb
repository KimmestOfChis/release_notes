class CreateIterations < ActiveRecord::Migration[5.1]
  def change
    create_table :iterations do |t|

      t.timestamps
    end
  end
end
