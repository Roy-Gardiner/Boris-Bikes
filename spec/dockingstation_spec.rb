describe DockingStation do 

  let(:bike) {Bike.new}
  let(:station) {DockingStation.new(:capacity => 120) }	


  it "should allow the setting of default capacity on initialising" do 
  	expect(station.capacity).to eq(120)
  end

  it "should have an argument" do
  	expect {station.dock()}.to raise_error(ArgumentError)
  end

  it "should not attempt to dock something not a bike" do
  	expect {station.dock(station)}.to raise_error(RuntimeError)
  end



  
end