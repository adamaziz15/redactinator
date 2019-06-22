# frozen_string_literal: true

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

class Redaction < ActiveRecord::Base
  # Associations
  belongs_to :attachment

  # Validations
  #
  # Note: Units used for these attributes are meant to be in pixels
  validates :x_origin, presence: true
  validates :y_origin, presence: true
  validates :height, presence: true
  validates :width, presence: true

  # Callbacks
  # TODO: Validate that the dimensions/positioning
  # respect the bounds of the image itself
end
