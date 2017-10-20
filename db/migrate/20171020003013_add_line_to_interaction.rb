class AddLineToInteraction < ActiveRecord::Migration[5.1]
  def change
    add_reference :interactions, :line, foreign_key: true
  end
end
