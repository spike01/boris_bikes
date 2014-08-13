require './lib/van'

describe Van do

  it_behaves_like "a bike container"

  let(:van) { Van.new(capacity: 20) }
  let(:bike) { Bike.new }
  let(:bike2) { Bike.new }
  let(:station) { DockingStation.new }
  let(:garage) { Garage.new }
  
  it "should allow setting default capacity on initializing" do
    expect(van.capacity).to eq(20)
  end

  it "should pick up broken bikes from a dock" do
   bike.break!
   bike2.break!
   station.dock(bike)
   station.dock(bike2)
   van.pickup_from_dock(station)
   expect(van.broken_bikes.count).to eq(2)
   expect(station.broken_bikes.count).to eq(0)
  end

  it "should deliver working bikes to a dock" do
   van.dock(bike)
   van.dock(bike2)
   van.deliver_to_dock(station)
   expect(station.available_bikes.count).to eq(2)
   expect(van.available_bikes.count).to eq(0)
  end

  it "should pick up working bikes from a garage" do
    garage.dock(bike)
    garage.dock(bike2)
    van.pickup_from_garage(garage)
    expect(van.available_bikes.count).to eq(2)
    expect(garage.available_bikes.count).to eq(0)
  end

  it "should deliver broken bikes to a garage" do
    van.dock(bike)
    van.dock(bike2)
    bike.break!
    bike2.break!
    van.deliver_to_garage(garage)
    expect(van.broken_bikes.count).to eq(0)
    expect(garage.available_bikes.count).to eq(2)
  end

end

