Company.destroy_all
City.destroy_all
Category.destroy_all
%w(editor training product agency).each do |name|
  Category.create(name: name)
end
