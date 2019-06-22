# == Schema Information
#
# Table name: attachments
#
#  id                 :integer          not null, primary key
#  censorship_status  :string
#  image_url          :string
#  original_image_url :string
#  e_consult_id       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

RSpec.describe Attachment, type: :model do
  subject { described_class.new }

  # Validations
  it {  is_expected.to validate_presence_of(:censorship_status) }
  it {  is_expected.to validate_presence_of(:original_image_url) }
  it {  is_expected.to validate_inclusion_of(:censorship_status).in_array(Attachment::VALID_STATUSES) }

  # Associations
  it { is_expected.to belong_to(:e_consult) }
  it { is_expected.to have_many(:redactions) }

  # TODO: specs for instance methods
end
