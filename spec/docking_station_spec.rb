require 'docking_station'

describe DockingStation do

  let(:bike) { double :bike, broken?: false }
  let(:broken_bike) {double :bike, {:broken? => true}}
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
    expect(station).not_to be_full
    20.times { station.dock(bike) }
    expect(station).to be_full
  end

  it "should be able to select non broken bikes" do
    station.dock(bike)
    station.dock(broken_bike)
    expect(station.available_bikes).to eq [bike]
  end

end

