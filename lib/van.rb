require_relative 'bike_container'

class Van

  include BikeContainer

  def initialise(options = {})

  	self.capacity = options.fetch(:capacity,capacity)
  end
end