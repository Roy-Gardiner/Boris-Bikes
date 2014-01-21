# to describe the functionality of a specific class, Bike
require_relative "../lib/bike"
require_relative "../lib/docking_station"
require_relative "../lib/bike_container"

class ContainerHolder; include BikeContainer; end

def fill_station(station)
  20.times{station.dock(Bike.new)}
end
def fill_holder(holder)
  10.times{holder.dock(Bike.new)}
end

describe BikeContainer do 

  let(:bike) {Bike.new}
  let(:holder) {ContainerHolder.new} 


  it "should accept a bike" do
  	expect(holder.bike_count).to eq(0)
   	holder.dock(bike)
   	expect(holder.bike_count).to eq(1)
  end

  it "should release a bike" do 
  	holder.dock(bike)
  	holder.release(bike)
  	expect(holder.bike_count).to eq(0)
  end 

  it "should know when it's full" do 
  	expect(holder.bike_count).to eq(0)
  	expect(holder.capacity).to eq(10)
  	expect(holder).not_to be_full
  	fill_holder(holder)
  	expect(holder).to be_full
  end

  it "should not accept a bike if it's full" do 
    fill_holder(holder)

    expect(lambda {holder.dock(bike)}).to raise_error(RuntimeError)
  end

  it "should provide the list of available bikes" do 
  	working_bike, broken_bike = Bike.new, Bike.new
  	broken_bike.break
  	holder.dock(working_bike)
  	holder.dock(broken_bike)
  	expect(holder.available_bikes).to eq([working_bike])
  end

end	

describe Bike do 

  let(:bike) {Bike.new}

  it "should not be broken after we create it"	do 
  	expect(bike).not_to be_broken
  end

  it "should be able to break" do 
    bike.break
    expect(bike).to be_broken
  end	

  it "should be able to get fixed" do 
  	bike.break
  	bike.fix
  	expect(bike).not_to be_broken 
  
  end	
end

describe DockingStation do 

  let(:bike) {Bike.new}
  let(:station) {DockingStation.new(:capacity => 120) }	


  it "should allow the setting of default capactiy on initialising" do 
  	expect(station.capacity).to eq(120)
  end

  

end