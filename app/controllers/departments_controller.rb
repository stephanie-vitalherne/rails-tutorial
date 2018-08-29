class DepartmentsController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
    @dept = Department.new
  end

  def create
    @company = Company.find(params[:company_id])
    @dept = Department.new(dept_params)
    if @dept.save
      msgg = "New Department created! Let's get you some employees"
      redirect_to @dept
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def index; end

  private

  def dept_params
    params.require(:department).permit(:name)
  end
end
