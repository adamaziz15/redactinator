# frozen_string_literal: true

# Configuration
JSONAPI.configure do |config|
  #:underscored_key, :camelized_key, :dasherized_key, or custom
  config.json_key_format = :underscored_key

  #:underscored_route, :camelized_route, :dasherized_route, or custom
  config.route_format = :underscored_route

  #:integer, :uuid, :string, or custom (provide a proc)
  config.resource_key_type = :string

  # optional request features
  config.allow_include = true
  config.allow_sort = true
  config.allow_filter = true

  # How to handle unsupported attributes and relationships which are provided in the request
  # true => raises an error
  # false => allows the request to continue. A warning is included in the response meta data indicating
  # the fields which were ignored. This is useful for client libraries which send extra parameters.
  config.raise_if_parameters_not_allowed = true

  # :none, :offset, :paged, or a custom paginator name
  config.default_paginator = :paged

  # Output pagination links at top level
  config.top_level_links_include_pagination = true

  config.default_page_size = 30
  config.maximum_page_size = 50

  # Output the record count in top level meta data for find operations
  config.top_level_meta_include_record_count = true
  config.top_level_meta_record_count_key = :record_count

  # For :paged paginators, the following are also available
  config.top_level_meta_include_page_count = false
  config.top_level_meta_page_count_key = :page_count

  config.resource_cache = Rails.cache
end
