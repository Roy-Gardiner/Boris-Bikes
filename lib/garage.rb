require_relative 'bike_container'

class Garage

  include BikeContainer
  
  def initialize(options = {})
  	self.capacity = options.fetch(:capacity,capacity)
  end

  def accept_broken_bikes van

  	while van.broken_bikes?  && !self.full? do
  		dock(van.release(van.broken_bikes.first))
  	end

  	self.bikes.each {|bike| bike.fix}

  end
end