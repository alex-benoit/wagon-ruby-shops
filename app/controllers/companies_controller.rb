class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def create
    category = Category.find(params[:category_id])
    @company = category.companies.build(product_params)
    redirect_to companies_path if @company.save
  end

  private

  def product_params
    params.require(:company).permit(:name, :employees, :url)
  end
end
