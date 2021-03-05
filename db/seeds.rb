# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
departments = %w[HR Engineering Sales Planning]

departments.each do |dep|
  Department.create!(name: dep)
end

Employee.create!(first_name: 'Andrew', last_name: 'Smith', email_address: 'andrew@cm.io', phone: '1234567890',
                 salary: '900000', department_id: Department.first.id)
Employee.create!(first_name: 'John', last_name: 'Smith', email_address: 'john@cm.io', phone: '6789012345',
                 salary: '800000', department_id: Department.second.id)
