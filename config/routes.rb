Rails.application.routes.draw do
  root 'tops#index'

  # 規約関係
  get '/terms_of_service', to: 'tops#terms_of_service'
  get '/privacy_policy', to: 'tops#privacy_policy'

  ## ユーザー登録関係
  resources :users, only: %i[new create]

  ## ログイン機能関係
  # RESTfulルートで生成したものを、ユーザーが認識しやすいようにカスタムルートで再設定
  # RESTfulルート
  resources :sessions, only: %i[new create destroy]

  # カスタムルート
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  # googleログイン
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", as: :auth_at_provider

  # クイズ、解答の表示
  namespace :simple_mode do
    resources :quizzes, only: %i[new] do
      collection do
        get 'answer', to: 'quizzes#show'
      end
    end
  end

  # チャレンジモードのクイズと解答の表示
  namespace :challenge_mode do
    resources :quizzes, only: [:new] do
      collection do
        get 'answer', to: 'quizzes#show'
        get 'start', to: 'quizzes#start'
        get 'result', to: 'quizzes#result'
      end
    end
    get 'ranking', to: 'quizzes#ranking'
  end

  # プロフィール、回答履歴
  resource :mypage, only: %i[show edit update]
  get "mypages/map_view", to: "mypages#map_view"

  # 地図比較ツール
  resources :compare_maps, only: %i[new create]

end
