Rails.application.routes.draw do
  root "home#index"
  # 動作確認用
  get "/homes", to: "home#index"
end
