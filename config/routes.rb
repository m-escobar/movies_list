Rails.application.routes.draw do
  root to: 'movies#index', as: 'movies_path'
end
