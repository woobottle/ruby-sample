Rails.application.routes.draw do
  root 'payments#index'
  get '/success' => 'payments#success'
  get '/fail' => 'payments#fail'
end
