class CompaniesController < ApplicationController
  before_action :find_company, only :[:show :edit]
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company
    else
      render 'new'
    end
  end

def edit; end
def show; end
def index; end
private

def company_params
  params.require(:company).permit(:name, :industry)
end

 def find_company
   @company = Company.find(params[:id])
 end

end
