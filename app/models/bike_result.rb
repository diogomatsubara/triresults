class BikeResult < LegResult
  field :mph, as: :mph, type: Float

  def calc_ave
    if event && secs
      miles = event.miles
      # For now we'll return a dummy floating point
      self.mph = miles.nil? ? nil : 21.12
    end
  end
end
