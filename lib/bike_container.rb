module BikeContainer

  DEFAULT_CAPACITY = 10

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
    number_of_bikes = options.fetch(:bikes, 0)
    number_of_bikes.times { bikes << Bike.new }
  end
 
  def bikes
    @bikes ||= []
  end
  
  def bikes=(value)
    @bikes = value
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

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

