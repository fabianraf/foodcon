class Admin::BaseController < ApplicationController
  #layout 'admin'
  before_filter :authenticate_user!, :except => [:exception_test]
  protect_from_forgery
  layout :layout_by_resource
  
  protected
  
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || "/admin"
  end
  
  def layout_by_resource
    unless devise_controller?
      "admin"
    end
  end
end