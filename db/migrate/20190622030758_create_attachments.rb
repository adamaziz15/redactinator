class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :censorship_status, default: 'OPEN'
      t.string :image_url
      t.string :original_image_url

      t.references :e_consult

      t.index :censorship_status
      t.index [ :e_consult_id, :censorship_status ]

      t.timestamps null: false
    end
  end
end
