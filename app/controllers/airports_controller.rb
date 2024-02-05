class AirportsController < ApplicationController
  def index
    @airports = AirportFacade.airports
    
  end
end