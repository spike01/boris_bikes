require_relative 'bike_container'

class Garage

  include BikeContainer

  def fix_bikes!
    broken_bikes.each { |bike| bike.fix! }
  end
  
end
