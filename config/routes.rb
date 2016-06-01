Rails.application.routes.draw do

  namespace :api, defaults: {format: :json } do
    namespace :v1 do

      resources :merchants, only: [:index, :show], module: 'merchants' do

        collection do
          get '/find',          to: 'merchants#find'
          get '/find_all',      to: 'merchants#find_all'
          get '/random',        to: 'merchants#random'
        end

        member do
          get '/items',         to: 'merchant_items#index'
          get '/invoices',      to: 'merchant_invoices#index'
        end
      end

      resources :customers, only: [:index, :show], module: 'customers' do

        collection do
          get '/find',          to: 'customers#find'
          get '/find_all',      to: 'customers#find_all'
          get '/random',        to: 'customers#random'
        end

        member do
          get '/transactions',  to: 'customer_transactions#index'
          get '/invoices', to: 'customer_invoices#index'
        end
      end

      resources :transactions, only: [:index, :show], module: 'transactions' do

        collection do
          get '/find',          to: 'transactions#find'
          get '/find_all',      to: 'transactions#find_all'
          get '/random',        to: 'transactions#random'
        end

      end

    end
  end
end
