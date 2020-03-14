class RemoveTtleFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :Title, :string
  end
end
