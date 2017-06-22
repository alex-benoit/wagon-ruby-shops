product = Category.create(name: "product")
agency = Category.create(name: "agency")

spot = Company.new(name: "Spotify", employees: "5000", url: "https://www.spotify.com/")
spot.category = product
spot.save

air = Company.new(name: "Airbnb", employees: "5000", url: "https://www.airbnb.com/")
air.category = product
air.save

wagon = Company.new(name: "Le Wagon", employees: "3000", url: "https://www.lewagon.com/")
wagon.category = agency
wagon.save

deli = Company.new(name: "Deliveroo", employees: "5000", url: "https://www.deliveroo.com/")
deli.category = product
deli.save
