module BikeContainer
  
  DEFAULT_CAPACITY = 10

  def bikes
  	@bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  attr_writer :capacity
  #def capacity=(value)
  #	@capacity = value
  #end
  
  def initialize(options = {})
  	@capacity = options.fetch(:capacity,DEFAULT_CAPACITY)
  	@bikes = []
  end 
  	
  def bike_count
  	bikes.count
  end

  def dock bike
  	raise "Argument to dock is not a bike" if !bike.is_a?(Bike)
    raise "Container is full" if full? 
  	bikes << bike
  end 	

  def release bike
  	raise "Argument to release is not a bike" if !bike.is_a?(Bike)
    bikes.delete(bike) 
    # not a problem if the bike isn't there -- returns a nil value
  end

  def full?
  	bike_count == capacity
  end

  def empty?
  	bike_count == 0
  end

  def available_bikes
    working_bikes.concat broken_bikes
  end

  def working_bikes
    bikes.reject{|bike| bike.broken?} 
  end
  
  def broken_bikes
    bikes.reject{|bike| !bike.broken?} 
  end

end