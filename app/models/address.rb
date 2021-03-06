class Address

  attr_accessor :city, :state, :location

  def initialize(city=nil, state=nil, location=nil)
    @city = city
    @state = state
    @location = location
  end

  def mongoize
    {:city=>@city, :state=>@state, :loc=>@location.mongoize}
  end

  def self.mongoize(object)
    case object
    when nil then object
    when Hash then
      Address.new(
        object[:city], object[:state], Point.mongoize(object[:loc])).mongoize
    when Address then object.mongoize
    end
  end

  def self.demongoize(object)
    case object
    when nil then object
    when Hash then Address.new(
      object[:city], object[:state], Point.demongoize(object[:loc]))
    end
  end

  def self.evolve(object)
    Address.mongoize(object)
  end
end
