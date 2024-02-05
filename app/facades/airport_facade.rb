class AirportFacade

  def self.airports
    airports = []
    all_airports = AirportService.airports
    all_airports.each_with_index do |airport_data, index|
      airports << Airport.new(id: index + 1, name: airport_data[:name])
    end
    airports
  end
end