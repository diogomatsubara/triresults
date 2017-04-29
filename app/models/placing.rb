class Placing
  attr_accessor :name, :place

  def initialize(name, place)
    @name = name
    @place = place
  end

  def mongoize
    {:name=>@name, :place=>@place}
  end

  def self.mongoize(object)
    case object
    when nil then object
    when Hash then Placing.new(object[:name], object[:place]).mongoize
    when Placing then object.mongoize
    end
  end

  def self.demongoize(object)
    case object
    when nil then object
    when Hash then Placing.new(object[:name], object[:place])
    when Placing then Placing
    end
  end

  def self.evolve(object)
    Placing.mongoize(object)
  end
end
