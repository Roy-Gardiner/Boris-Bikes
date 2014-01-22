describe Garage do 
  let(:bike) {Bike.new}
  let(:garage) {Garage.new(:capacity => 1000)}
  let(:van) {Van.new(:capacity => 5)}

  it "should allow the setting of default capacity on initialising" do 
  	expect(garage.capacity).to eq(1000)
  end	
  
  it "should accept all bikes on a van, fixing them at once" do 

    bb1,bb2,bb3,bb4,bb5 = Bike.new, Bike.new, Bike.new, Bike.new, Bike.new, Bike.new 
    bb1.break
    bb2.break
    bb3.break
    bb4.break
    bb5.break

    van.dock(bb1)
    van.dock(bb2)
    van.dock(bb3)
    van.dock(bb4)
    van.dock(bb5)

    expect(garage.bike_count).to eq(0)
    expect(van.bike_count).to eq(5)
    
    garage.accept_broken_bikes(van)
    
    expect(van.bike_count).to eq(0)
    expect(garage.bike_count).to eq(5)
    expect(garage.broken_bikes?).to eq(false)
  end
end