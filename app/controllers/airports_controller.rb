class AirportsController < ApplicationController
  def index
    @airports = AirportFacade.airports
    render json: AirportSerializer.new(@airports)
  end
end