class AddStartDateToIteration < ActiveRecord::Migration[5.1]
  def change
    add_column :iterations, :start_date, :date
  end
end
