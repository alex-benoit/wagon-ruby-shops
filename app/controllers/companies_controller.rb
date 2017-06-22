class CompaniesController < ApplicationController
  def index
    if params[:search] && !params[:search].blank?
      @companies = Company.where("name iLIKE :name", name: "%#{params[:search]}%")
    else
      @companies = Company.all
    end
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
