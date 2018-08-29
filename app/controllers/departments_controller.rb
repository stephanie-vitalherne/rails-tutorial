class DepartmentsController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
  end

  def edit; end

  def show; end

  def index; end
end
