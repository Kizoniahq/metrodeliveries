class LocationsController < ApplicationController


  def location_params
    params.require(:location).permit(:location, :status, :user_id, :order_id)
  end
end
