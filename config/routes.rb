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

        member do
          get '/invoices',      to: 'transaction_invoices#index'
        end
      end

      resources :invoices, only: [:index, :show], module: 'invoices' do

        collection do
          get '/find',          to: 'invoices#find'
          get '/find_all',      to: 'invoices#find_all'
          get '/random',        to: 'invoices#random'
        end

        member do
          get '/transactions',  to: 'invoices_transactions#index'
          get '/invoice_item',  to: 'invoices_invoice_items#index'
          get '/items',         to: 'invoices_items#index'
          get '/customer',      to: 'invoices_customers#index'
          get '/merchant',      to: 'invoices_merchants#index'
        end
      end

      resources :items, only: [:index, :show], module: 'items' do

        collection do
          get '/find',          to: 'items#find'
          get '/find_all',      to: 'items#find_all'
          get '/random',        to: 'items#random'
        end

        member do
          get '/invoice_items', to: 'items_invoice_items#index'
          get '/merchant',      to: 'items_merchants#index'
        end
      end

      resources :invoice_items, only: [:index, :show], module: 'invoice_items' do

        collection do
          get '/find',          to: 'invoice_items#find'
          get '/find_all',      to: 'invoice_items#find_all'
          get '/random',        to: 'invoice_items#random'
        end

        member do
          get '/invoice',       to: 'invoice_items_invoices#index'
          get '/item',          to: 'invoice_items_items#index'
        end
      end

    end
  end
end
