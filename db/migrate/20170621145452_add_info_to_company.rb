class AddInfoToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :name, :string
    add_column :companies, :startup, :boolean
    add_column :companies, :employees, :integer
    add_column :companies, :url, :string
  end
end
