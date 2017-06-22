class CompaniesController < ApplicationController
  def index
    @companies = Company.all
    @locations = Location.includes(:city).all
    @company = Company.new
    @hash = Gmaps4rails.build_markers(@locations.map(&:city)) do |city, marker|
      marker.lat city.latitude
      marker.lng city.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def create
    @company = Company.create(product_params)
    city = City.find_by(city_params) || City.create(city_params)
    Location.create(city: city, company: @company)
  end

  private

  def product_params
    params.require(:company).permit(:name, :employees, :url, :category_id)
  end

  def city_params
    attributes = params.require(:city).permit(:name, :country)
    attributes.fetch(:name).downcase!
    attributes
  end
end
