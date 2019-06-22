10.times { EConsult.create }

EConsult.pluck(:id).each do |ec_id|
  3.times { Attachment.create(e_consult_id: ec_id, censorship_status: Attachment::VALID_STATUSES.sample, original_image_url: 'http://testdata.io') }
end

Attachment.pluck(:id).each do |at_id|
  rand(5).times { Redaction.create(attachment_id: at_id, x_origin: rand(50), y_origin: rand(50), height: rand(30), width: rand(30)) }
end
