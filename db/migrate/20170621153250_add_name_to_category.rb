class AddNameToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :name, :string
    add_reference :companies, :category, index: true
  end
end
