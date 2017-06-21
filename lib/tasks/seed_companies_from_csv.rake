namespace :companies do
  task seed_from_csv: :environment do
    require 'csv'

    path = "#{File.expand_path File.dirname(__FILE__)}/../../db/data"
    files = Dir["#{path}/*.csv"]
    files.each do |file|
      CSV.foreach(file, col_sep: ';', headers: :first_row) do |row|
        row['startup'] = row['type'].downcase.strip == 'startup'
        company = Company.new(row)
        company.save
        row[city].split(', ').each do |city|
          address = "#{city}, #{row['country']}"
          location = Location.new(address: address)
          location
        end

      end
    end
  end
end
