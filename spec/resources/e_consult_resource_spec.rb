RSpec.describe EConsultResource, type: :resource do
  let(:e_consult) { build(:e_consult) }
  subject { described_class.new(e_consult, {}) }

  it { is_expected.to have_many(:attachments) }
end
