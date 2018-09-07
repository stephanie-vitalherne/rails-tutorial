class DepartmentsController < ApplicationController
  before_action :find_dept, only: [:show]
  before_action :find_company, only: %i[new create]

  def new
    @dept = Department.new
  end

  def create
    @dept = Department.new(dept_params)
    @dept.company_id = @company.id
    if @dept.save
      msg = "New Department created! Let's get you some employees"
      redirect_to company_department_path(@dept.company_id, @dept.id)
    else
      render 'new'
    end
    p msg
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

  def find_dept
    @dept = Department.find(params[:id])
  end

  def find_company
    @company = Company.find(params[:company_id])
end
end
