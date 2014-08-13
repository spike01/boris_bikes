require './lib/van'

describe Van do

  let(:van) { Van.new(capacity: 66) }

  it "should allow seeting default capacity on initialising" do
    expect(van.capacity).to eq(66)
  end


end

