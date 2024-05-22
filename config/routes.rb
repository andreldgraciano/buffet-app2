Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }

  devise_for :buffet_profiles, controllers: {
    sessions: 'buffet_profiles/sessions',
    registrations: 'buffet_profiles/registrations'
  }

  root to: "home#index"
end
