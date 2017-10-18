class AddIterationToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :iteration, foreign_key: true
  end
end
