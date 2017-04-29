class RacerInfo
  include Mongoid::Document
  field :racer_id, as: :_id
  field :_id, default:->{racer_id}
  field :fn, as: :first_name, type: String
  field :ln, as: :last_name, type: String
  field :g, as: :gender, type: String
  field :yr, as: :birth_year, type: Integer
  field :res, as: :residence, type: Address

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :gender
  validates_presence_of :birth_year
  validates :gender, :inclusion => {:in=> %w(M F)}
  validates :birth_year, :numericality => { 
    :less_than => Date.current.year}

  embedded_in :parent, polymorphic: true
end
