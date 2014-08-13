require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

  let(:bike) { Bike.new }
  let(:holder) { ContainerHolder.new }
 # let(:holder) { described_class.new }
  def fill_holder(holder)
  holder.capacity.times { holder.dock(Bike.new) }
  end

  it "should dock a bike" do
    expect(holder.bike_count).to eq(0)
    holder.dock(bike)
    expect(holder.bike_count).to eq(1)
  end

  it "should release a bike" do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  it "should know when it's full" do
    fill_holder(holder)
    expect(holder).to be_full
  end

  it "should not dock a bike if it's full" do
    fill_holder(holder)
    expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
  end

  it "should provide the list of available bikes" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break!
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([working_bike])
  end

  it "should provide the list of broken bikes" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break!
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.broken_bikes).to eq([broken_bike])
  end
end
