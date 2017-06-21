class AddCatReferenceToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_references :companies, :category, index: true
  end
end
