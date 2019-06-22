# == Schema Information
#
# Table name: e_consults
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe EConsult, type: :model do
  subject { described_class.new }

  # Associations
  it { is_expected.to have_many(:attachments) }
end
