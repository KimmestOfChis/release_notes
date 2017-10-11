class AddIterationReferenceToInteraction < ActiveRecord::Migration[5.1]
  def change
    add_reference :interactions, :iteration, foreign_key: true
  end
end
