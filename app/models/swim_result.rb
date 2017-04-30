class SwimResult < LegResult
  field :pace_100, as: :pace_100, type: Float

  def calc_ave
    if event && secs
      meters = event.meters
      # Time it takes the swimmer to travel 100 meters given the distance of
      # the event and the time it took to complete.
      self.pace_100 = meters.nil? ? nil : secs/(meters/100)
    end
  end
end
