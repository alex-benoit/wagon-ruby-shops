Category.destroy_all
%(editor training product agency).each do |name|
  Category.create(name: name)
end
