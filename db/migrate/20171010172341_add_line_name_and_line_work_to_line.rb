class AddLineNameAndLineWorkToLine < ActiveRecord::Migration[5.1]
  def change
    add_column :lines, :line_name, :string
    add_column :lines, :line_work, :string
  end
end
