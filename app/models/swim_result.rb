class SwimResult < LegResult
  field :pace_100, as: :pace_100, type: Float

  def calc_ave
    if event && secs
      meters = event.meters
      # For now we'll return a dummy floating point
      self.pace_100 = meters.nil? ? nil : 21.12
    end
  end
end
