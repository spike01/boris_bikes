require_relative 'bike_container'

class Van

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def pickup_from_dock(station)
    station.broken_bikes.each { |bike| dock(bike) ; station.release(bike) }
  end

end

