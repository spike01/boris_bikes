require 'garage'

describe Garage do
  it_behaves_like "a bike container"

  let(:garage) { Garage.new(capacity: 666) }
  let(:broken_bike1) {Bike.new(broken: true) }
  let(:broken_bike2) {Bike.new(broken: true) }

  it "should allow setting default capacity on initializing" do
    expect(garage.capacity).to eq(666)
  end

  it "should fix all bikes it contains" do
    garage.dock(broken_bike1)
    garage.dock(broken_bike2)
    expect(broken_bike1.broken?).to be false
    expect(broken_bike2.broken?).to be false
  end
end
