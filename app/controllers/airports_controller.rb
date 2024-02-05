class AirportsController < ApplicationController
  def index
    @airports = AirportFacade.airports
    require 'pry'; binding.pry
  end
end