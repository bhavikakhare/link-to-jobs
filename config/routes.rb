Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'job_postings', to: 'job_postings#index', as: 'jobpostings'

end
