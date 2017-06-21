class RemoveStartupFromCompanies < ActiveRecord::Migration[5.0]
  def change
    remove_column :companies, :startup, :boolean
  end
end
