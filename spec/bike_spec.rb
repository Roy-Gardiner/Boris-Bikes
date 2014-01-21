# to describe the functionality of a specific class, Bike
require "spec_helper"

class ContainerHolder; include BikeContainer; end

def fill_station(station)
  20.times{station.dock(Bike.new)}
end
def fill_holder(holder)
  10.times{holder.dock(Bike.new)}
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