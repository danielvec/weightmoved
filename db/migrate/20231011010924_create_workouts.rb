class CreateWorkouts < ActiveRecord::Migration[7.0]
  def change
    create_table :workouts do |t|
      t.date :date
      t.string :workout_name
      t.decimal :total

      t.timestamps
    end
  end
end
