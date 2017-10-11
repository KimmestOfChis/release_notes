class CreateIterations < ActiveRecord::Migration[5.1]
  def change
    create_table :iterations do |t|
      t.string :iteration_number
      t.string :drop_number
      t.date :date_of_drop

      t.timestamps
    end
  end
end
