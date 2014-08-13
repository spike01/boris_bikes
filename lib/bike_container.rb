module BikeContainer

  DEFAULT_CAPACITY = 10
  
  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

#  def bike_count
#    bikes.count
#  end

  def dock(bike)
    raise "No space!" if full?
    raise "Not a bike!" if bike.class != Bike
    bikes << bike
  end

  def release(bike)
    raise "No bikes!" if bikes.empty?
    @bikes.delete(bike)
  end

  def full?
    bikes.count == capacity
  end

  def empty?
    bikes.count == 0
  end

  def available_bikes
    bikes.reject { |bike| bike.broken? }
  end

  def broken_bikes
    bikes.select { |bike| bike.broken? }
  end
end

