class EConsultResource < JSONAPI::Resource
  attributes :updated_at, :created_at

  # Associations
  has_many :attachments
end
