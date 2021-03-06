require './lib/van'

describe Van do

  it_behaves_like "a bike container"

  let(:van) { Van.new(capacity: 20, bikes: 2) }
  let(:broken_bike) { Bike.new(broken: true) }
  let(:broken_bike2) { Bike.new(broken: true) }
  let(:station) { DockingStation.new }
  let(:garage) { Garage.new(bikes: 2) }
  
  it "should allow setting default capacity on initializing" do
    expect(van.capacity).to eq(20)
  end

  it "should be able to initialize with bikes inside" do
    expect(van.available_bikes.count).to eq(2)
  end


  it "should pick up broken bikes from a dock" do
   station.dock(broken_bike)
   station.dock(broken_bike2)
   van.pickup_from_dock(station)
   expect(van.broken_bikes.count).to eq(2)
   expect(station.broken_bikes.count).to eq(0)
  end

  it "should deliver working bikes to a dock" do
   van.deliver_to_dock(station)
   expect(station.available_bikes.count).to eq(2)
   expect(van.available_bikes.count).to eq(0)
  end

  it "should pick up working bikes from a garage" do
    van.pickup_from_garage(garage)
    expect(van.available_bikes.count).to eq(4)
    expect(garage.available_bikes.count).to eq(0)
  end

  it "should deliver broken bikes to a garage" do
    van.dock(broken_bike)
    van.dock(broken_bike2)
    van.deliver_to_garage(garage)
    expect(van.broken_bikes.count).to eq(0)
    expect(garage.available_bikes.count).to eq(4)
  end

end

