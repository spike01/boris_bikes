require 'garage'

describe Garage do

  let(:garage) { Garage.new(:capacity => 666) }
  let(:broken_bike1) {Bike.new}
  let(:broken_bike2) {Bike.new}

  it "should allow setting default capacity on initializing" do
    expect(garage.capacity).to eq(666)
  end

  it "should fix all bikes it contains" do
    broken_bike1.break!
    broken_bike2.break!
    garage.dock(broken_bike1)
    garage.dock(broken_bike2)
    garage.fix_bikes!
    expect(broken_bike1.broken?).to be false
    expect(broken_bike2.broken?).to be false
  end
end
