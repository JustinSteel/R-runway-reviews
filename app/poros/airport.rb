class Airport
  attr_reader :id,
              :type,
              :name

  def initialize(data)
    # require 'pry'; binding.pry
    # @id = data[:id].to_i
    @type = 'airport'
    @name = data[:name]
  end
end