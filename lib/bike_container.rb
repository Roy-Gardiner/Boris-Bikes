module BikeContainer
  
  DEFAULT_CAPACITY = 10

  def bikes
  	@bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
  	@capacity = value
  end
  
  def initialize(options = {})
  	@capacity = options.fetch(:capacity,DEFAULT_CAPACITY)
  	@bikes = []
  end 
  	
  def bike_count
  	bikes.count
  end

  def dock bike
    raise "Container is full" if full? 
  	bikes << bike
  end 	

  def release bike
    bikes.delete(bike) 
  end

  def full?
  	bike_count == capacity
  end

  def available_bikes
    bikes.reject{|bike| bike.broken?} 
  end
end