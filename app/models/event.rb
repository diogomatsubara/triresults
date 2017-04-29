class Event
  include Mongoid::Document
  field :o, as: :order, type: Integer
  field :n, as: :name, type: String
  field :d, as: :distance, type: Float
  field :u, as: :units, type: String

  def meters
    if !units.nil? && !distance.nil?
      case units
      when "miles" then distance * 1609.344
      when "yards" then distance * 0.9144
      when "meters" then distance
      when "kilometers" then distance * 1000
      end
    else
      nil
    end
  end

  def miles
    if !units.nil? && !distance.nil?
      case units
      when "miles" then distance
      when "yards" then distance * 0.000568182
      when "meters" then distance * 0.000621371
      when "kilometers" then distance * 0.621371
      end
    else
      nil
    end
  end
end
