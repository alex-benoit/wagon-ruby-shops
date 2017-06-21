class AddCompanyReferenceToLocations < ActiveRecord::Migration[5.0]
  def change
    add_reference :locations, :company, index: true
  end
end
