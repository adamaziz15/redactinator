# frozen_string_literal: true
require 'spec_helper'

RSpec.describe AttachmentsController, type: :controller do
  # TODO: more specs

  describe 'PUT #update' do
    subject { patch :update, params: { id: attachment.id, data: data, upload: upload } }

    let(:e_consult) { create(:e_consult) }
    let(:upload) { nil }
    let(:attachment) do
      create(
        :attachment,
        {
          original_image_url: 'https://pathtoimage.com',
          censorship_status: 'OPEN',
          e_consult_id: e_consult.id
        }
      )
    end
    let(:data) do
      {
        type: 'attachments',
        id: attachment.id,
        attributes: {
          censorship_status: 'IN_PROGRESS'
        }
      }
    end

    before do
      request.env['HTTP_ACCEPT'] = JSONAPI::MEDIA_TYPE
      request.env['CONTENT_TYPE'] = JSONAPI::MEDIA_TYPE
    end

    it 'allows updates to the #censorship_status of an attachment' do
      subject

      expect(attachment.reload.censorship_status).to eq('IN_PROGRESS')
    end

    context 'when params[:upload] is set to true' do
      let(:upload) { 'true' }
      let(:data) do
        {
          type: 'attachments',
          id: attachment.id,
          attributes: {
            censorship_status: 'DONE'
          }
        }
      end

      it 'triggers the processing/uploading of the redacted attachment' do
        expect_any_instance_of(attachment.class).to receive(:process_and_upload).once
        subject
        expect(attachment.reload.censorship_status).to eq('DONE')
      end
    end
  end
end
