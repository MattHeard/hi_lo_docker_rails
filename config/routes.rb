Rails.application.routes.draw do
  get '/guess', to: 'guess#evaluate'
end
