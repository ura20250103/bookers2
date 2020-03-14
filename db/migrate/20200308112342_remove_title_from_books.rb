class RemoveTitleFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :title, :string
  end
end
