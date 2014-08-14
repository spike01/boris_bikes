require_relative 'bike_container'

class Garage

  include BikeContainer
  
  DEFAULT_CAPACITY = 100
  
  def dock(bike)
    super
    bike.fix!
  end
  
end
