class AddLineReferenceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :line, foreign_key: true
  end
end
