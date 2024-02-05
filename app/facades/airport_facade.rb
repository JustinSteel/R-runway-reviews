class AirportFacade
  def self.airports
    AirportService.airports.map do |airport_data|
      Airport.new(airport_data)
    end
  end
end