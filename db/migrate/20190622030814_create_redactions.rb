class CreateRedactions < ActiveRecord::Migration[5.2]
  def change
    create_table :redactions do |t|
      t.float :x_origin, default: 0
      t.float :y_origin, default: 0
      t.float :height, default: 50
      t.float :width, default: 50

      t.references :attachment

      t.timestamps null: false
    end
  end
end
