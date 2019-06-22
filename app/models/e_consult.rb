# frozen_string_literal: true

# == Schema Information
#
# Table name: e_consults
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EConsult < ActiveRecord::Base
  # Associations
  has_many :attachments
end
