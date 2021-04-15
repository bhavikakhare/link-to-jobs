Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  root to: redirect('/job_postings')
  
  get 'job_postings', to: 'job_postings#index', as: 'job_postings'
  post 'job_postings', to: 'job_postings#create'
  get 'job_postings/new', to: 'job_postings#new', as: 'new_job_posting'
  get 'job_postings/:id', to: 'job_postings#show', as: 'job_posting'
  delete 'job_postings/:id', to: 'job_postings#destroy'
  #devise_for :users, :controllers => { :registrations => 'users/registrations' }
end