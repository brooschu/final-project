Rails.application.routes.draw do
  # Routes for the Type resource:

  # CREATE
  match("/new_type_form", { :controller => "types", :action => "blank_form", :via => "get" })
  match("/insert_type_record", { :controller => "types", :action => "save_new_info", :via => "post" })

  # READ
  match("/types", { :controller => "types", :action => "list", :via => "get" })
  match("/types/:id_to_display", { :controller => "types", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_type_form/:id_to_prefill", { :controller => "types", :action => "prefilled_form", :via => "get" })
  match("/update_type_record/:id_to_modify", { :controller => "types", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_type/:id_to_remove", { :controller => "types", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Review resource:

  # CREATE
  match("/new_review_form", { :controller => "reviews", :action => "blank_form", :via => "get" })
  match("/insert_review_record", { :controller => "reviews", :action => "save_new_info", :via => "post" })

  # READ
  match("/reviews", { :controller => "reviews", :action => "list", :via => "get" })
  match("/reviews/:id_to_display", { :controller => "reviews", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_review_form/:id_to_prefill", { :controller => "reviews", :action => "prefilled_form", :via => "get" })
  match("/update_review_record/:id_to_modify", { :controller => "reviews", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_review/:id_to_remove", { :controller => "reviews", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Whiskey entry resource:

  # CREATE
  match("/new_whiskey_entry_form", { :controller => "whiskey_entries", :action => "blank_form", :via => "get" })
  match("/insert_whiskey_entry_record", { :controller => "whiskey_entries", :action => "save_new_info", :via => "post" })

  # READ
  match("/whiskey_entries", { :controller => "whiskey_entries", :action => "list", :via => "get" })
  match("/whiskey_entries/:id_to_display", { :controller => "whiskey_entries", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_whiskey_entry_form/:id_to_prefill", { :controller => "whiskey_entries", :action => "prefilled_form", :via => "get" })
  match("/update_whiskey_entry_record/:id_to_modify", { :controller => "whiskey_entries", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_whiskey_entry/:id_to_remove", { :controller => "whiskey_entries", :action => "remove_row", :via => "get" })
  

  #------------------------------
  
   match("/", { :controller => "home", :action => "home", :via => "get" })

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
