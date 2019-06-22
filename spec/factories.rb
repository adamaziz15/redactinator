FactoryBot.define do
  factory :e_consult do
    sequence(:id)

    # Associations
    attachments { [] }
  end

  factory :attachment do
    sequence(:id)

    # Attributes
    image_url { nil }
    original_image_url { nil }
    censorship_status { nil }

    # Associations
    e_consult { nil }
    redactions { [] }
  end

  factory :redaction do
    sequence(:id)

    # Attributes
    x_origin { nil }
    y_origin { nil }
    width { nil }
    height { nil }

    # Associations
    attachment { nil }
  end
end
