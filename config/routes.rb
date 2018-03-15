require 'api_version_constraint'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, constraint: { subdomain: 'api' }, path: '/' do
    namespace :v1, path: '/', constraint: ApiVersionConstraint.new(version: 1, default: true) do
      resources :users , only: [:index, :show, :create, :update]
    end
  end
end