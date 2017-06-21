namespace :companies do
  desc 'Add large rails companies from alex repo'
  task dump: :environment do
    product_category = Category.find(name)
    Company.create(category)
  end
end
