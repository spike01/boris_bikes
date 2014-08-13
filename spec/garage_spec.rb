require 'garage'

describe Garage do

  let(:garage) { Garage.new(:capacity => 666) }
  it "should allow setting default capacity on initializing" do
    expect(garage.capacity).to eq(666)
  end
end
