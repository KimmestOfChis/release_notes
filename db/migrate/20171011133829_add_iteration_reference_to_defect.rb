class AddIterationReferenceToDefect < ActiveRecord::Migration[5.1]
  def change
    add_reference :defects, :iteration, foreign_key: true
  end
end
