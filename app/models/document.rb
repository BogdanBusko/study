class Document
  include Mongoid::Document

  embedded_in :conference

  field :name, type: String

  mount_uploader :file, PdfUploader
end
