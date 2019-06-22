# frozen_string_literal: true

class RedactionResource < BaseResource
  # Resource Attributes
  attributes :x_origin, :y_origin, :height, :width

  # Associations
  has_one :attachment
end
