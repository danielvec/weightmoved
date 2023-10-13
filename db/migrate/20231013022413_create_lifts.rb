class CreateLifts < ActiveRecord::Migration[7.0]
  def change
    create_table :lifts do |t|
      t.string :lift_name
      t.references :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
