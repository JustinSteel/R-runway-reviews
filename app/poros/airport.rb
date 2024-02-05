class Airport
  attr_accessor :name,
                :id

  def initialize(data)
    @name = data[:name]
    @id = data[:id]
  end
end