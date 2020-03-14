class RemoveOpiniFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :Opinion, :string
  end
end
