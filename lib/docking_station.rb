require_relative 'bike_container'

class DockingStation

  include BikeContainer
  
  def initialize(options = {})
  		# self.capacity is calling the capacity= menthod (note: the equals sign is part of the method name)
  		# defined in BikeContainer

  		# capacity (the second argument to fetch()) is calling the capacity() method
  		# in BikeContainer

  	self.capacity = options.fetch(:capacity,capacity)
  	
  end 
end