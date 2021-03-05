# frozen_string_literal: true

module EmployeesHelper
  def options_for_select_department
    Department.all.collect { |u| { name: u.name, id: u.id } }
  end
end
