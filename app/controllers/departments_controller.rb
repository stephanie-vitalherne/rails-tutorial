class DepartmentsController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
    @dept = Department.new
  end

  def create
    @company = Company.find(params[:company_id])
    @dept = Department.new(dept_params)
    @dept.company_id = @company.id
    if @dept.save
      msgg = "New Department created! Let's get you some employees"
      redirect_to company_department_path(@dept.company_id, @dept.id)
    else
      render 'new'
    end
  end

  def edit; end

  def show
    @dept = Department.find(params[:id])
  end

  def index; end

  private

  def dept_params
    params.require(:department).permit(:name)
  end

  def find_dept; end
end
