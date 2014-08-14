
class Bike

  def initialize(params = {})
    @broken = params.fetch(:broken, false) 
  end

  def broken?
    @broken
  end

  def break!
    @broken = true
    self
  end

  def fix!
    @broken = false
  end
end
