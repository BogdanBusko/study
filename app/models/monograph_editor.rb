class MonographEditor
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :monograph

  field :first_name,  type: String
  field :last_name,   type: String
  field :surname,     type: String
  field :phone,       type: String
  field :email,       type: String

  validates :first_name, :last_name, :surname, :email, presence: true

  def full_name
    "#{self.first_name} #{self.last_name} #{self.surname}"
  end
end
