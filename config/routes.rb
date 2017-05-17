Rails.application.routes.draw do
  get "home/index"
  devise_for :users, :controllers => { :registrations => "users", sessions: "users/sessions" }
  root :to => "home#index", :constraints => lambda { |request| request.env['warden'].user.nil? }, as: :unauthenticated_root
  root :to => 'loans_section/loans/dashboard#index', :constraints => lambda { |request| request.env['warden'].user.role == 'loan_officer' if request.env['warden'].user }, as: :loans_section_root
  root :to => 'consumers_section/store#index', :constraints => lambda { |request| request.env['warden'].user.role == 'cashier' if request.env['warden'].user }, as: :cashier_root
  scope "/admin" do
    resources :users, only: [:show, :edit, :update]
    resources :settings, only: [:index], module: :admin
    resources :cooperatives, only: [:show, :new, :create], module: :admin do
      resources :departments, only: [:new, :create]
    end
  end
  resources :relationships, only: [:new, :create], module: :members
  resources :members, except: [:destroy] do
    resources :relationships, only: [:new, :create]
    resources :common_share_capitals, only: [:new, :create], module: :members
    resources :preferred_share_capitals, only: [:new, :create], module: :members
    resources :savings, only: [:new, :create], module: :members
    resources :time_deposits, only: [:new, :create], module: :members
    resources :loans, only: [:new, :create], module: :loans_section
    resources :membership_fees, only: [:new, :index], module: :fees
  end
  resources :users, only: [:index, :new, :create]
  get 'accounting/reports/balance_sheet' => 'accounting_/reports#balance_sheet'
  get 'accounting/reports/financial_statement' => 'accounting/reports#financial_statement'
  get 'accounting/reports/income_statement' => 'accounting/reports#income_statement'

  resources :coop_services, only: [:index]
  namespace :coop_services do
    resources :share_capital_products, only: [:new, :create]
    resources :savings_products, only: [:new, :create]
    resources :time_deposit_products, only: [:new, :create]

  end
  resources :time_deposits, only: [:index, :show] do
    resources :deposits, only: [:new, :create], module: :time_deposits
  end
  resources :savings, only: [:index, :show] do
    resources :deposits, only: [:new, :create], module: :savings
    resources :withdrawals, only: [:new, :create], module: :savings
  end
  resources :share_capitals, only: [:index, :show] do
    resources :capital_build_ups, only: [:new, :create], module: :share_capitals
  end
  namespace :coop do
    resources :settings, only: [:index]
    resources :programs, only: [:new, :create]
    resources :branches, only: [:show] do
      resources :departments, only: [:new, :create]
    end
    resources :departments, only: [:show]
    resources :cooperatives, only: [:edit, :update] do
      resources :branches, only: [:new, :create, :show]
    end
  end
  namespace :loans_section do
    resources :settings, only: [:index]
    resources :loan_products, only: [:new, :create], module: :settings
    resources :loan_approvers, only: [:new, :create], module: :settings

    resources :imbursements, only: [:index]
    resources :loans, only: [:index, :show] do
      resources :approvals, only: [:new, :create], module: :loans
      resources :disbursements, only: [:new, :create], module: :loans
      resources :payments, only: [:new, :create], module: :loans
    end
  end


  namespace :accounting do
    resources :balance_sheet, only:[:index]
    resources :income_statement, only:[:index]
    resources :dashboard, only: [:index]
    resources :reports, only:[:index]
    resources :accounts do
      get :autocomplete_accounting_account_name, on: :collection
      match "/activate" => "accounts#activate", via: [:post], on: :member
      match "/deactivate" => "accounts#deactivate", via: [:post], on: :member
    end
    resources :assets, controller: 'accounts', type: 'Accounting::Asset'
    resources :liabilities, controller: 'accounts', type: 'Accounting::Liability'
    resources :equities, controller: 'accounts', type: 'Accounting::Equity'
    resources :revenues, controller: 'accounts', type: 'Accounting::Revenue'
    resources :expenses, controller: 'accounts', type: 'Accounting::Expense'
    resources :member_entries, only: [:new, :create]
    resources :employee_entries, only: [:new, :create]
    resources :supplier_entries, only: [:new, :create]

    resources :entries do
      get :autocomplete_entry_description, on: :collection
      match "/scope_to_date" => "entries#scope_to_date", as: :scope_to_date, via: [:get], on: :collection
    end
    resources :reports, only:[:index]
    resources :financial_statement, module: :reports
    resources :statement_of_operations, only:[:index], module: :reports
  end

  resources :consumers_section, only: [:index]
  namespace :consumers_section do
    resources :store, only: [:index]
    resources :line_items, only: [:new, :create]
    resources :products, only: [:index, :new, :create, :show] do
      resources :stocks, only: [:new, :create], module: :products
    end
    resources :stocks, only: [:index, :show, :new, :create]
    resources :orders, only: [:index, :show, :new, :create]
  end

  resources :suppliers, only: [:index, :show, :new,:create]
end
