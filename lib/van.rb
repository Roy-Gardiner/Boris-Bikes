require_relative 'bike_container'

class Van

  include BikeContainer

  def initialise(options = {})

  	self.capacity = options.fetch(:capacity,capacity)
  end

  def collect_broken_bikes station 

  	while station.broken_bikes?  && !self.full? do
  		dock(station.release(station.broken_bikes.first))
  	end
  end

  def collect_fixed_bikes garage

  	while garage.working_bikes?  && !self.full? do
  		dock(garage.release(garage.working_bikes.first))
  	end
  end
end