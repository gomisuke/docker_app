Rails.application.routes.draw do
  devise_for :customers, class_name: "Admin::Customer"
  devise_for :customers, class_name: "EndUser::Customer"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
