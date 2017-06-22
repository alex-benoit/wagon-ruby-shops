namespace :companies do
  task seed_from_csv: :environment do
    require 'csv'

    path = "#{File.expand_path File.dirname(__FILE__)}/../../db/data"
    files = Dir["#{path}/*.csv"]
    counter = 0
    errors = 0
    files.each do |file|
      puts
      puts "seeding from #{file}"
      CSV.foreach(file, col_sep: ';', headers: :first_row, header_converters: :symbol) do |row|
        category = Category.find_by(name: row[:category])
        company_attributes = {
          url: row[:url],
          name: row[:name],
          startup: row[:type].nil? ? false : row[:type].downcase.strip == 'startup',
          category: category.nil? ? Category.find_by_name('product') : category
        }
        company = Company.new(company_attributes)
        puts
        puts company.name
        if company.save
          counter += 1
          puts "#{company.name} created!"
          country = row[:country].strip.capitalize
          row[:city].split(', ').each do |city_name|
            puts city_name
            city = City.find_by(name: city_name.strip.capitalize, country: country)
            unless city
              city = City.create(name: city_name, country: country)
              puts "#{city.name} created"
            end
            location = Location.create(city: city, company: company)
          end
        else
          errors += 1
          puts company.errors.full_messages
        end
      end
    end
    puts
    puts "done #{counter} creations, #{errors} errors"
  end
end
