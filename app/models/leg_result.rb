class LegResult
  include Mongoid::Document
  field :secs, as: :secs, type: Float

  def secs=(value)
    self[:secs] = value
    calc_ave
  end

  def calc_ave
    #subclasses will calc event-specific average
  end

  after_initialize do |doc|
    doc.calc_ave
  end
end
