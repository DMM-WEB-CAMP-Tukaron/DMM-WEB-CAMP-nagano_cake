Rails.application.routes.draw do

   devise_for :admins, controllers:{
      sessions: 'admin/sessions',
      passwords: 'admin/passwords',
      registrations: 'admin/registrations'
    }

  devise_for :customers, controllers:{
      sessions: 'customers/sessions',
      passwords: 'customers/passwords',
      registrations: 'customers/registrations'
    }

  namespace :admin do
    resources :items
    resources :genres, only: [:index, :create, :edit, :update]
    resources :oder_details, only: [:update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :oders, only: [:show, :update]
    get 'homes/top' => 'homes#top'
  end

  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'

    resource :customers, only:[:show]
    get 'unsubscribe' => 'customers#unsubscribe'
    get 'customer/edit' => 'customers#edit'
    patch 'customer' => 'customers#update'
    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'withdraw' => 'customers#withdraw'

    resources :items, only:[:index, :show]

    resources :addres, only:[:index, :edit, :create, :update, :destroy]


    resources :cart_items, only:[:index, :update, :destroy, :create]
    delete 'destroy_all' => 'cart_items#destroy_all'



    resources :oders, only:[:new, :create, :index, :show]
    post 'comfirm' => 'oders#comfirm'
    get 'complete' => 'oders#complete'
  end

end