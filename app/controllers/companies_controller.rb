class CompaniesController < ApplicationController
  def index
    # @companies = Company.all
    @companies = [
      {name: "Airbnb", url: "www.lewagon.com", employees: 5000, logo: "//logo.clearbit.com/airbnb.com", category: "product"},
      {name: "Spotify", url: "www.lewagon.com", employees: 300, logo: "//logo.clearbit.com/spotify.com", category: "agency"},
      {name: "Deliveroo", url: "www.lewagon.com", employees: 20, logo: "//logo.clearbit.com/deliveroo.com", category: "product"}
    ]
    @company = Company.new
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
