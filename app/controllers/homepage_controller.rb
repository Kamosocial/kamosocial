class HomepageController < ApplicationController
  helper_method :resource_name, :resource, :devise_mapping,
    :user_signed_in, :current_user

  def index
    @users = User.all
    @all_interests = Interest.all
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
