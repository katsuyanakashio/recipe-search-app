Rails.application.routes.draw do
  root 'recipes#index'
  
  resources :recipes do
    collection do
      get 'search'
    end
  end
  
  resources :categories, only: [:index, :show]
  
  # ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check
end
