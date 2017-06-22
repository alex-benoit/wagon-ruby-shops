class CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :update]
  def index
    # @companies = Company.all
    @companies = [
      {name: "Airbnb", url: "www.lewagon.com", employees: 5000, logo: "//logo.clearbit.com/airbnb.com"},
      {name: "Spotify", url: "www.lewagon.com", employees: 300, logo: "//logo.clearbit.com/spotify.com"},
      {name: "Deliveroo", url: "www.lewagon.com", employees: 20, logo: "//logo.clearbit.com/deliveroo.com"}
    ]

  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(product_params)
    if @company.save
      redirect_to companies_path
    else
      render :new
    end
  end

  def update
    if @company.update(product_params)
      redirect_to companies_path
    else
      render :edit
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def product_params
    params.require(:company).permit(:name, :employees, :url)
  end
end
