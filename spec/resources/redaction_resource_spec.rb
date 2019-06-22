RSpec.describe RedactionResource, type: :resource do
  let(:redaction) { build(:redaction) }
  subject { described_class.new(redaction, {}) }

  it { is_expected.to have_attribute :x_origin }
  it { is_expected.to have_attribute :y_origin }
  it { is_expected.to have_attribute :height }
  it { is_expected.to have_attribute :width }
  it { is_expected.to have_one(:attachment) }
end
