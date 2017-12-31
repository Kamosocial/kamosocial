class HomepageController < ApplicationController
  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def index
    @users = User.all
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
