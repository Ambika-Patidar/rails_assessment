# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'employees#index'

  get '/employees', to: 'employees#index'
  put '/employees/:id/departments', to: 'employees#update_department'
end
