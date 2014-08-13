require './lib/van'

describe Van do

  let(:van) { Van.new(capacity: 66) }
  let(:broken_bike) {Bike.new}
  let(:broken_bike2) {Bike.new}
  let(:station) {DockingStation.new}
  
  it "should allow setting default capacity on initializing" do
    expect(van.capacity).to eq(66)
  end

  it "should pick up broken bikes from a dock" do
   broken_bike.break!
   broken_bike2.break!
   station.dock(broken_bike)
   station.dock(broken_bike2)
   van.pickup_from_dock(station)
   expect(van.broken_bikes.count).to eq(2)
   expect(station.broken_bikes.count).to eq(0)
  end

end

