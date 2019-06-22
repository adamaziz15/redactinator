# == Schema Information
#
# Table name: redactions
#
#  id            :integer          not null, primary key
#  x_origin      :float
#  y_origin      :float
#  height        :float
#  width         :float
#  attachment_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

RSpec.describe Redaction, type: :model do
  subject { described_class.new }

  # Validations
  it {  is_expected.to validate_presence_of(:x_origin) }
  it {  is_expected.to validate_presence_of(:y_origin) }
  it {  is_expected.to validate_presence_of(:height) }
  it {  is_expected.to validate_presence_of(:width) }

  # Associations
  it { is_expected.to belong_to(:attachment) }
end

