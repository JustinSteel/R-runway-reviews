class AirportFacade
  def self.airports
    service = AirportService.new
    service.airports.map do |airport_data|
      require 'pry'; binding.pry
      Airport.new(airport_data)
    end
  end
end