class AirportFacade
  def self.airports
    airports = []
    AirportService.airports.each do |airport_data|
      airport = Airport.new(airport_data)
      airports << airport
    end
    airports
  end
end