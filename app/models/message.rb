class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, type: String
  field :second_name, type: String
  field :email, type: String
  field :phone, type: String
  field :question, type: String

  validates :first_name, :second_name, :email, :phone, :question, presence: true
end
