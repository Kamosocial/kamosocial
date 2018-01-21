class PreferencesController < ApplicationController
  helper_method :resource_name, :resource, :devise_mapping,
    :user_signed_in, :current_user
  before_action :authenticate_user!

  def index
    @interests = current_user.interests
    @places = current_user.places
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
