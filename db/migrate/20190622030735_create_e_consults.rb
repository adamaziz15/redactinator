class CreateEConsults < ActiveRecord::Migration[5.2]
  def change
    create_table :e_consults do |t|
      t.timestamps null: false
    end
  end
end
