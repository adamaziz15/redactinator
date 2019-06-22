# frozen_string_literal: true

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
class Attachment < ActiveRecord::Base
  #============================================
  # Constants
  #============================================
  VALID_STATUSES = %w[OPEN IN_PROGRESS DONE].freeze

  #============================================
  # Associations
  #============================================
  belongs_to :e_consult
  has_many :redactions

  #============================================
  # Validations
  #============================================
  validates :censorship_status,
    presence: true,
    inclusion: { in: VALID_STATUSES, message: "must be one of 'OPEN', 'IN_PROGRESS', or 'DONE'" }

  validates :original_image_url, presence: true

  #============================================
  # Instance Methods
  #============================================

  # #image_url is set when #censorship_status
  # transitions to "Done".
  #
  # When censorship_status has never been set to :DONE:
  #   - return the url for the original image
  #
  # When censorship_status has been set to :DONE:
  #   - return the url for the censored image
  def attachment_url
    image_url || original_image_url
  end

  def process_and_upload
    return unless censorship_status == 'DONE'
    # TODO:
    # 1. generate redacted image and upload to file server
    # 2. set #image_url
    # 3. if upload fails, status should be rolled back to :IN_PROGRESS or :OPEN
  end 
end
