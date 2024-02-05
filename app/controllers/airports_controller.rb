class AirportsController < ApplicationController
  def index
    @airports = AirportFacade.airports
    render json: @airports
  end
end