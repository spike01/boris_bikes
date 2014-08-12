require 'docking_station'

describe DockingStation do

  let(:bike) {Bike.new}
  #  let(:broken_bike) {double :bike, {:broken? => true}}
  let(:station) { DockingStation.new(:capacity => 20) }

  it "should accept a bike" do
    expect(station.bike_count).to eq(0)
    station.dock(bike)
    expect(station.bike_count).to eq (1)
  end

  it "should release a bike" do
    station.dock(bike)
    station.release(bike)
    expect(station.bike_count).to eq(0)
  end

  it "should know when it's full" do
    fill_station(station)
    20.times { station.dock(bike) }
    expect(station).to be_full
  end

  it "should not accept a bike if it's full" do
    20.times { station.dock(Bike.new) }
    expect(lambda { station.dock(bike) }).to raise_error(RuntimeError)
  end
  
  xit "should be able to select non broken bikes" do
    station.dock(bike)
    station.dock(broken_bike)
    expect(station.available_bikes).to eq [bike]
  end

end

