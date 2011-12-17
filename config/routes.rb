Family::Application.routes.draw do  
  
  namespace :admin do
    resources :users
    resources :appointments
  end

  devise_for :users
  devise_for :doctors
  devise_for :patients
  devise_for :admin
 
 ###### Main Routes #######
  
  resources :users
  resources :home
  resources :patients
  resources :patient_images
  resources :appointments
  resources :uploads
  resources :doctors
  resources :accounts
  resources :treatment_forms
  resources :invitations
  resources :clinics
  #resources :registrations
 
  match "/users/sign_out" => "devise/sessions#destroy"
  match "/all_accounts" => "accounts#all_accounts"
  match "/patient_details/:id" => "patients#patient_details"
  match "/doctor_patients" => "doctors#doctor_patients", :as => :my_patients
  
  match '/create_master_account' => 'users#create_master_account'
  match '/appointment_approve/:id' => 'appointments#appointment_approve', :as => :appointment_approve
  
  match '/staff' => 'home#staff', :as => :staff
  match '/company' => 'home#company', :as => :company
  match '/admin' => 'home#admin', :as => :admin
  match '/download/:id' => 'uploads#download', :as => :download 

  #Invitations Routes
  match '/send_invitation' => 'invitations#send_invitation'
  match '/sending_invitation' => 'invitations#sending_invitation'
  match '/creating_invitation' => 'invitations#creating_invitation'
  
  # Registering user Routes
  match '/sign_up_user' => 'invitations#sign_up_user'
  match '/create_user' => 'invitations#create_user'
  
  # Redirection after sign_up page
  namespace :user do
    root :to => "home#index"
  end
  
  # Subdomain Admin Routes
  constraints(:subdomain => "admin") do
     root :to => "clinics#index"
     match '/' => 'clinics#index'
     match '/admin' => redirect("/clinics")   
  end
    
  # default root file
  root :to => "home#index"

end