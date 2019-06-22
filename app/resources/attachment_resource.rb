class AttachmentResource < JSONAPI::Resource
  # Resource Attributes
  attributes :censorship_status, :attachment_url

  # Associations
  has_one :e_consult
  has_many :redactions

  # Callbacks
  after_update :finalize_redaction, if: :upload_requested?

  # Calls method at the model level which is responsible
  # for uploading the redacted attachment
  def finalize_redaction
    @model.process_and_upload
  end

  # We consider the upload requested only when the censorship_status of
  # the attachment has been updated to 'DONE' and the upload param has been
  # specified in the request.
  def upload_requested?
    @model.censorship_status == 'DONE' && context[:params][:upload] == 'true'
  end
end
