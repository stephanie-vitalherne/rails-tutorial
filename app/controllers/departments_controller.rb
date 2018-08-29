class DepartmentsController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
    @dept = Department.new
  end

  def edit; end

  def show; end

  def index; end

  private

  def dept_params
    params.require(:department).permit(:name)
  end
end
