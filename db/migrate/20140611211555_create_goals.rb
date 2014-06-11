class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :goal
      t.date :date_created
      t.date :estimated_completion_date
      t.date :actual_completion_date
      t.text :accomplishments
      t.references :user, index: true
      t.timestamps
    end
  end
end

