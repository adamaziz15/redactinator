RSpec.describe AttachmentResource, type: :resource do
  let(:attachment) { build(:attachment) }
  subject { described_class.new(attachment, {}) }

  it { is_expected.to have_attribute :censorship_status }
  it { is_expected.to have_attribute :attachment_url }

  it { is_expected.to have_one(:e_consult) }
  it { is_expected.to have_many(:redactions) }
end
