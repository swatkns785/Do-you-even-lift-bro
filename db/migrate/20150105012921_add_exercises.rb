class AddExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name, null: false
      t.integer :reps, null: false
      t.integer :user_id, null: false
      t.integer :workout_id, null: false
      t.timestamps
    end
    add_index :exercises, [:user_id, :workout_id]
  end
end
