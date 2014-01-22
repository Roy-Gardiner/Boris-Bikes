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

  it "should not attempt to release a bike that isn't there" do 
  	holder.release(bike)
  	expect(holder.release(bike)).to eq(nil)
  end

  it "should have an argument" do 
  	expect {holder.release()}.to raise_error(ArgumentError)
  end

  
  it "should not attempt to release something not a bike" do 
  	expect {holder.release(holder)}.to raise_error(RuntimeError)
  end


  it "should know when it's full" do 
  	expect(holder.bike_count).to eq(0)
  	expect(holder.capacity).to eq(10)
  	expect(holder).not_to be_full
  	fill_holder(holder)
  	expect(holder).to be_full
  end

  it "should know when it's empty" do 
     expect(holder.empty?).to be_true
     expect(holder).to be_empty
  end


  it "should not accept a bike if it's full" do 
    fill_holder(holder)

    expect(lambda {holder.dock(bike)}).to raise_error(RuntimeError)
  end

  it "should provide a list of working bikes" do 
    working_bike, broken_bike, broken_bike_2 = Bike.new, Bike.new, Bike.new
    broken_bike.break
    broken_bike_2.break
    holder.dock(working_bike)
    holder.dock(broken_bike)
    holder.dock(broken_bike_2)
    expect(holder.working_bikes).to eq([working_bike])
  end
  
  it "should provide a list of broken bikes" do 
    working_bike, broken_bike, broken_bike_2 = Bike.new, Bike.new, Bike.new
    broken_bike.break
    broken_bike_2.break
    holder.dock(working_bike)
    holder.dock(broken_bike)
    holder.dock(broken_bike_2)
    expect(holder.broken_bikes).to eq([broken_bike, broken_bike_2])
  end

  it "should provide a list of available bikes" do 
  	working_bike, broken_bike = Bike.new, Bike.new
  	broken_bike.break
  	holder.dock(working_bike)
  	holder.dock(broken_bike)
  	expect(holder.bikes).to eq([working_bike, broken_bike])
  end

  it "should be able to tell you if it has any broken bikes" do 
    broken_bike = Bike.new
    broken_bike.break
    holder.dock(broken_bike)
    expect(holder.broken_bikes?).to eq(true)
  end

  it "should be able to tell you if it has any working bikes" do 
    bike = Bike.new
    holder.dock(bike)
    expect(holder.working_bikes?).to eq(true)
  end

end	