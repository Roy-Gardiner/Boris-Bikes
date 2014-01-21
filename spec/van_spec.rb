describe Van do 
  let(:bike) {Bike.new}
  let(:van) {Van.new(:capacity => 5)}

  it "should allow the setting of default capacity on initialising" do 
  	expect(van.capacity).to eq(5)
  end	

  it "It should, to show it's picking up methods from the BikeContainer module, accept a bike" do
  	expect(van.bike_count).to eq(0)
   	van.dock(bike)
   	expect(van.bike_count).to eq(1)
  end
end