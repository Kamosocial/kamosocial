class PlacesController < ApplicationController
  helper_method :resource_name, :resource, :devise_mapping,
    :user_signed_in, :current_user
  before_action :authenticate_user!

  def index
    @all_places = Place.all
    gon.places = @all_places.collect do |place|
      interests = place.interests.collect { |interest| interest.name }
      {interests: interests.uniq,
      place: place}
    end
  end

  def edit
    current_user.places_list = places_params['places_list']
    redirect_to preferences_path
  end

  private

  def places_params
    params.require(:user).permit(:places_list)
  end
end
