require './lib/bike_container'

  shared_examples "a bike container" do

    let(:holder) { described_class.new }
    let(:bike) { Bike.new }

  def fill_holder(holder)
  holder.capacity.times { holder.dock(Bike.new) }
  end

  it "should be able to initialize with bikes inside" do
    holder2 = described_class.new(bikes: 5)
    expect(holder2.available_bikes.count).to eq(5)
  end

  it "should dock a bike" do
    expect(holder.empty?).to be true
    holder.dock(bike)
    expect(holder.available_bikes.any? || holder.broken_bikes.any?).to be true
  end

  it "should release a bike" do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.empty?).to be true
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

  it "should know when it's empty" do
    expect(lambda { holder.release(bike) }).to raise_error(RuntimeError)    
  end

  it "should only accept bikes" do
    expect(lambda { holder.dock(holder) }).to raise_error(RuntimeError)
  end

end
