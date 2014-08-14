require 'bike'

describe Bike do

  let (:bike) { Bike.new }

  it "should be able to be initialized broken" do
    bike2 = Bike.new(broken: true)
    expect(bike2.broken?).to be true
  end

  it "should not be broken after we create it" do
    expect(bike).not_to be_broken
  end

  it "should be able to get fixed" do
    bike.break!
    bike.fix!
    expect(bike).not_to be_broken
  end
end

