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