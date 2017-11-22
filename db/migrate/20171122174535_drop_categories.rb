class DropCategories < ActiveRecord::Migration[5.1]
  def change
    drop_table :categories
  end
end
