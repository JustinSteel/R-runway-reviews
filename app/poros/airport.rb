class Airport
  attr_reader :icao,
              :name,
              :city,
              :country

  def initialize(data)
    # require 'pry'; binding.pry
    # @id = data[:id].to_i
    # @type = 'airport'
    @name = data[:name]
    @icao = data[:icao]
    @city = data[:city]
    @country = data[:country]
  end
end