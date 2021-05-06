Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :users, :controllers => { :registrations => 'users/registrations' }

  root to: redirect('/job_postings')

  get 'users/:id', to: 'users#show', as: 'user_profile'

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

  # Index Page (Recruiter)
  get 'users/:user_id/job_postings/:posting_id/job_applications', to: 'job_applications#index', as: 'job_applications_r'
  # Index Page (Applicant)
  get 'users/:user_id/job_applications', to: 'job_applications#index', as: 'job_applications_a'
  # Create Action (Applicant)
  post 'job_postings/:id', to: 'job_applications#create'
  # Show Page (Recruiter)
  get 'users/:user_id/job_postings/:posting_id/job_applications/:id', to: 'job_applications#show', as: 'job_application_r'
  # Show Page (Applicant)
  get 'users/:user_id/job_applications/:id', to: 'job_applications#show', as: 'job_application_a'
  # Delete Action (Applicant)
  delete 'users/:user_id/job_applications/:id', to: 'job_applications#destroy'
  # New Page (Applicant)
  get 'job_postings/:id/new_job_application', to: 'job_applications#new', as: 'new_job_application'

  #job posting questions
  get 'job_postings/:id/questions', to: 'questions#index', as: 'jp_questions'
  post 'job_postings/:id/questions/new', to: 'questions#create'
  get 'job_postings/:id/questions/new', to: 'questions#new', as: 'new_jp_question'


  # Review Actions
  get 'companies/:company_id/reviews/:id/edit', to: 'reviews#edit', as: 'edit_review'

  post 'companies/:id', to: 'reviews#create'

  patch 'companies/:company_id/reviews/:id', to: 'reviews#update', as: 'review'
  put 'companies/:company_id/reviews/:id', to: 'reviews#update'
  delete 'companies/:company_id/reviews/:id', to: 'reviews#destroy'

end