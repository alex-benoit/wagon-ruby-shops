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

    category = Category.find(params[:category_id])
    category = Category.find(params[:category_id])

    @company = category.companies.build(product_params)
    redirect_to companies_path if @company.save
  end

  private

  def product_params
    params.require(:company).permit(:name, :employees, :url)
  end
end
