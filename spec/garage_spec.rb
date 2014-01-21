describe Garage do 
  let(:bike) {Bike.new}
  let(:garage) {Garage.new(:capacity => 1000)}

  it "should allow the setting of default capacity on initialising" do 
  	expect(garage.capacity).to eq(1000)
  end	

  it "It should, to show it's picking up methods from the BikeContainer module, accept a bike" do
  	expect(garage.bike_count).to eq(0)
   	garage.dock(bike)
   	expect(garage.bike_count).to eq(1)
  end

end