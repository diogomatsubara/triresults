class RunResult < LegResult
  field :mmile, as: :minute_mile, type: Float

  def calc_ave
    if event && secs
      miles = event.miles
      # For now we'll return a dummy floating point
      self.minute_mile = miles.nil? ? nil : 21.12
    end
  end
end
