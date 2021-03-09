class DepartmentsController < ApplicationController
  def get_employees
    department = Department.find(params[:id])
    dep_employees = department.employees.map(&:first_name)
    respond_to do |format|
      format.json { render json: dep_employees }
    end
  end
end
