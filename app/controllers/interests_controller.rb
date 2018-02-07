class InterestsController < ApplicationController
  helper_method :resource_name, :resource, :devise_mapping,
    :user_signed_in, :current_user
  before_action :authenticate_user!

  def index
    @interests_sample = Interest.where.not(name: current_user.interests.collect{|interest| interest.name})
      .order(updated_at: :desc).limit(10)
  end

  def edit
    current_user.interests_list = interests_params['interests_list']
    redirect_to preferences_path
  end

  private

  def interests_params
    params.require(:user).permit(:interests_list)
  end
end
