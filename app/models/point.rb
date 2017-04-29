class Point

  attr_accessor :longitude, :latitude

  def initialize(longitude, latitude)
    @longitude = longitude
    @latitude = latitude
  end

  def mongoize
    return {:type=>"Point", :coordinates=>[@longitude, @latitude]}
  end

  def self.mongoize(object)
    case object
    when nil then object
    when Hash then
      if object[:type]
        Point.new(object[:coordinates][0], object[:coordinates][1]).mongoize
      else
        Point.new(object[:lng], object[:lat]).mongoize
      end
    when Point then object.mongoize
    end
  end

  def self.demongoize(object)
    case object
    when nil then object
    when Hash then
      if object[:type]
        Point.new(object[:coordinates][0], object[:coordinates][1])
      else
        Point.new(object[:lng], object[:lat])
      end
    when Point then object
    end
  end

  def self.evolve(object)
    Point.mongoize(object)
  end
end
