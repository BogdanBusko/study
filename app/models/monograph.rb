class Monograph
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :monograph_editors

  field :name,          type: String
  field :authors,       type: String
  field :author_email,  type: String
  field :published,     type: Mongoid::Boolean

  validates :name, :authors, :author_email, presence: true

  mount_uploader :file, PdfUploader
end
