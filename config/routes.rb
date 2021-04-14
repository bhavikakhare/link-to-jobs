Rails.application.routes.draw do

     # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  devise_for :users
  root to: redirect('/job_postings')

  
  get 'companies/new', to: 'companies#new', as: 'new_company'
  get 'companies/:id', to: 'companies#show', as: 'company'
  post 'companies', to: 'companies#create', as: 'companies'
  patch 'companies/:id', to: 'companies#update'
  put 'companies/:id', to: 'companies#update'
  delete 'companies/:id', to: 'companies#destroy'
  
  get 'job_postings', to: 'job_postings#index', as: 'job_postings'
  post 'job_postings', to: 'job_postings#create'
  get 'job_postings/new', to: 'job_postings#new', as: 'new_job_posting'
  get 'job_postings/:id', to: 'job_postings#show', as: 'job_posting'
  delete 'job_postings/:id', to: 'job_postings#destroy'

end
