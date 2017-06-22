class AddStartupToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :startup, :boolean, default: :false
  end
end
