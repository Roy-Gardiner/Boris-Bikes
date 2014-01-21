describe DockingStation do 

  let(:bike) {Bike.new}
  let(:station) {DockingStation.new(:capacity => 120) }	


  it "should allow the setting of default capacity on initialising" do 
  	expect(station.capacity).to eq(120)
  end
end