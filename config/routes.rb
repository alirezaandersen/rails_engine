Rails.application.routes.draw do

  namespace :api, defaults: {format: :json } do
    namespace :v1 do

      resources :merchants, only: [:index, :show], module: 'merchants' do

        collection do
          get '/find',          to: 'merchants#find'
          get '/find_all',      to: 'merchants#find_all'
          get '/random',        to: 'merchants#random'
            #all merchants
          get '/most_items',    to: 'merchants_most_items#index' #
          get '/most_revenue',  to: 'merchants_most_revenue#index'
          get '/revenue',       to: 'merchants_revenue_date#index'
        end

        #everything in member has to be called upon an id of merchants and some may follow with params of something
        member do
          get '/items',             to: 'merchant_items#index'
          get '/invoices',          to: 'merchant_invoices#index'
          #single merchants
          get '/revenue',           to: 'merchant_revenues#index'
          get '/revenue',           to: 'merchant_revenues#index'
          get '/favorite_customer', to: 'merchant_favorite_customer#index'
          get '/customers_with_pending_invoices', to: 'merchant_customers_with_pending_invoices#index'
        end
      end

      resources :customers, only: [:index, :show], module: 'customers' do

        collection do
          get '/find',          to: 'customers#find'
          get '/find_all',      to: 'customers#find_all'
          get '/random',        to: 'customers#random'
        end

        member do
          get '/transactions',     to: 'customer_transactions#index'
          get '/invoices',         to: 'customer_invoices#index'
          get 'favorite_merchant', to: 'customers_favorite_merchant#index'
        end
      end

      resources :transactions, only: [:index, :show], module: 'transactions' do

        collection do
          get '/find',          to: 'transactions#find'
          get '/find_all',      to: 'transactions#find_all'
          get '/random',        to: 'transactions#random'
        end

        member do
          get '/invoice',      to: 'transaction_invoices#index'
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
          get '/invoice_items',  to: 'invoices_invoice_items#index'
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
          get '/most_revenue',  to: 'items_most_revenue#index'
          get '/most_items',    to: 'items_most_items#index'
        end

        member do
          get '/invoice_items', to: 'items_invoice_items#index'
          get '/merchant',      to: 'items_merchants#index'
          get '/best_day',      to: 'items_best_day#index'
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
