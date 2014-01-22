describe Van do 
  let(:bike) {Bike.new}
  let(:van) {Van.new(:capacity => 5)}
  let(:station) {DockingStation.new(:capacity => 120) }
  let(:garage) {Garage.new(:capacity => 1000)} 

  it "should allow the setting of default capacity on initialising" do 
  	expect(van.capacity).to eq(5)
  end	

  it "should be able collect a broken bike" do
    expect(van.bike_count).to eq(0)
    expect(station.bike_count).to eq(0)

    broken_bike = Bike.new
    broken_bike.break
    station.dock(broken_bike)
    expect(station.bike_count).to eq(1)
    expect(station.broken_bikes[0]).to eq(broken_bike)

    van.collect_broken_bikes(station)
    expect(van.bike_count).to eq(1)
    expect(station.bike_count).to eq(0)
  end

  it "should collect as many broken bikes from a station as it can carry" do
    expect(van.bike_count).to eq(0)
    expect(station.bike_count).to eq(0)
    bikeOK = Bike.new
    van.dock(bikeOK)
    expect(van.bike_count).to eq(1)

    bb1,bb2,bb3,bb4,bb5,bb6 = Bike.new, Bike.new, Bike.new, Bike.new, Bike.new, Bike.new 
    bb1.break
    bb2.break
    bb3.break
    bb4.break
    bb5.break
    bb6.break

    station.dock(bb1)
    station.dock(bb2)
    station.dock(bb3)
    station.dock(bb4)
    station.dock(bb5)
    station.dock(bb6)

    expect(station.bike_count).to eq(6)
    expect(station.broken_bikes[0]).to eq(bb1)

    van.collect_broken_bikes(station)
    expect(van.bike_count).to eq(5)
    expect(station.bike_count).to eq(2)
  end

  it "should load up as many fixed bikes from the garage as it can carry" do
    expect(van.bike_count).to eq(0)
    expect(garage.bike_count).to eq(0)
    bikeOK = Bike.new
    van.dock(bikeOK)
    
    bb1,bb2,bb3,bb4,bb5,bb6 = Bike.new, Bike.new, Bike.new, Bike.new, Bike.new, Bike.new 
    garage.dock(bb1)
    garage.dock(bb2)
    garage.dock(bb3)
    garage.dock(bb4)
    garage.dock(bb5)
    garage.dock(bb6)
    
    expect(garage.bike_count).to eq(6)
    expect(van.bike_count).to eq(1)
    
    van.collect_fixed_bikes(garage)
    
    expect(van.bike_count).to eq(5)
    expect(garage.bike_count).to eq(2)
  end
end