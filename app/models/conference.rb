class Conference
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :conference_members
  embeds_many :documents

  accepts_nested_attributes_for :documents

  before_create :change_conference_status

  field :name,        type: String
  field :description, type: String
  field :start_date,  type: Date
  field :ended,       type: Mongoid::Boolean

  validates :name, :start_date, presence: true

  mount_uploader :file_ua, PdfUploader
  mount_uploader :file_en, PdfUploader

  def change_conference_status
    self.ended = true if self.start_date < Date.today
  end

  def self.update_conferences_status
    each do |conference|
      conference.update_attributes(ended: true) if self.start_date < Date.today
    end
  end
end
