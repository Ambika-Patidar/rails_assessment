# frozen_string_literal: true

class EmployeesController < ApplicationController
  def index
    @employees = Employee.all.includes(:department)
  end

  def update_department
    employee = Employee.find(params[:id])
    employee.update(department_id: params[:department_id])
    redirect_to employees_path
  end
end
