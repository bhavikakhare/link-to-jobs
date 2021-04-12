Rails.application.routes.draw do

     # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  devise_for :users
  root to: redirect('/job_postings')

  get 'companies/:id', to: 'companies#show', as: 'company'
  get 'job_postings', to: 'job_postings#index', as: 'job_postings'
  post 'job_postings', to: 'job_postings#create'
  get 'job_postings/new', to: 'job_postings#new', as: 'new_job_posting'
  get 'job_postings/:id', to: 'job_postings#show', as: 'job_posting'
  delete 'job_postings/:id', to: 'job_postings#destroy'

end
