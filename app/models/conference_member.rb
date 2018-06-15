class ConferenceMember
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :conference

  field :first_name,        type: String
  field :last_name,         type: String
  field :surname,           type: String
  field :position,          type: String
  field :organization,      type: String
  field :academic_status,   type: String
  field :scientific_degree, type: String
  field :contry,            type: String
  field :city,              type: String
  field :address,           type: String
  field :phone,             type: String
  field :email,             type: String

  validates :first_name, :last_name, :surname, :contry, :city, :address, :phone, :email, presence: true

  def full_name
    "#{self.first_name} #{self.last_name} #{self.surname}"
  end
end
