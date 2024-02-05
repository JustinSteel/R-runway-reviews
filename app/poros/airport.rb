class Airport
  attr_reader :id,
              :type,
              :name

  def initialize(data)
    @id = data[:id]
    @type = 'airport'
    @name = data[:name]
  end
end