class EmployeesController < ApplicationController
  before_action :find_employee, only: %i[new create]
  def new
    @employee = Employee.new
    @depts = Department.where(company_id: @company_id)
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.company_id = @company.id
    @employee.generate_eid
    if @employee.save
      msg = "New Employee created! Let's get you some employees"
      redirect_to company_path(@employee.company_id)
    else
      render 'new'
    end
    p msg
  end

  def edit; end

  def show; end

  def index; end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :department_id)
  end

  def find_employee
    @company = Company.find(params[:company_id])
  end
end
